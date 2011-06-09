package org.osflash.stream.types.string
{
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.StreamTypes;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class StreamStringOutput implements IStreamOutput
	{
		
		/**
		 * @private
		 */
		private var _buffer : String;
		
		/**
		 * @private
		 */
		private var _position : uint;
		
		public function StreamStringOutput()
		{
			_buffer = '';
			_position = 0;
		}

		/**
		 * @inheritDoc
		 */
		public function writeUTF(value : String) : void
		{
			const bit : String = value;
			const length : int = bit.length;
			
			const packet : String = StreamTypes.UTF + length + ":" + bit;
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, packet);
			
			_buffer = parts.join('');
			_position += packet.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeInt(value : int) : void
		{
			const bit : String = value.toString();
			const length : int = bit.length;
			
			const packet : String = StreamTypes.INT + length + ":" + bit;
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, packet);
			
			_buffer = parts.join('');
			_position += packet.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeUnsignedInt(value : uint) : void
		{
			const bit : String = value.toString();
			const length : int = bit.length;
			
			const packet : String = StreamTypes.UINT + length + ":" + bit;
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, packet);
			
			_buffer = parts.join('');
			_position += packet.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeFloat(value : Number) : void
		{
			const bit : String = value.toString();
			const length : int = bit.length;
			
			const packet : String = StreamTypes.FLOAT + length + ":" + bit;
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, packet);
			
			_buffer = parts.join('');
			_position += packet.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeBoolean(value : Boolean) : void
		{
			const bit : String = value ? 'true' : 'false';
			const length : int = bit.length;
			
			const packet : String = StreamTypes.BOOLEAN + length + ":" + bit;
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, packet);
			
			_buffer = parts.join('');
			_position += packet.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear() : void
		{
			_buffer = "";
			_position = 0;
		}
		
		/**
		 * @private
		 */
		internal function get buffer() : String
		{
			return _buffer;
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function get position() : uint
		{
			return _position;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set position(value : uint) : void
		{
			_position = value;
		}
		
		/**
		 * Return the stream as a string
		 */
		public function toString() : String
		{
			return _buffer.substr(_position);
		}
	}
}
