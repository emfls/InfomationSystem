package regist;

public class Schedule {
	
	public String[] splitIndexforSchedule(String timeIndex)
	{
		String[] spIndex=timeIndex.split(",");
		return spIndex;
	}
	
	public String scheduleIndexChangeToList(String[] spIndex)
	{
		
		String exchange="";
		for(int i=0; i<spIndex.length;i++)
		{
			exchange += changeIndexToTime(Integer.parseInt(spIndex[i])) + ", ";
		}
		return exchange;
	}
	
	public String changeIndexToTime(int a){
		      String b = null;
		      switch(a){
		      case 0:
		         b="월0A";
		         break;
		      case 1:
		         b="화0A";
		         break;
		      case 2:
		         b="수0A";
		         break;
		      case 3:
		         b="목0A";
		         break;
		      case 4:
		         b="금0A";
		         break;
		      case 5:
		         b="토0A";
		         break;
		      case 6:
		         b="월0B";
		         break;
		      case 7:
		         b="화0B";
		         break;
		      case 8:
		         b="수0B";
		         break;
		      case 9:
		         b="목0B";
		         break;
		      case 10:
		         b="금0B";
		         break;
		      case 11:
		         b="토0B";
		         break;
		      case 12:
		         b="월1A";
		         break;
		      case 13:
		         b="화1A";
		         break;
		      case 14:
		         b="수1A";
		         break;
		      case 15:
		         b="목1A";
		         break;
		      case 16:
		         b="금1A";
		         break;
		      case 17:
		         b="토1A";
		         break;
		      case 18:
		         b="월1B";
		         break;
		      case 19:
		         b="화1B";
		         break;
		      case 20:
		         b="수1B";
		         break;
		      case 21:
		         b="목1B";
		         break;
		      case 22:
		         b="금1B";
		         break;
		      case 23:
		         b="토1B";
		         break;
		      case 24:
		         b="월2A";
		         break;
		      case 25:
		         b="화2A";
		         break;
		      case 26:
		         b="수2A";
		         break;
		      case 27:
		         b="목2A";
		         break;
		      case 28:
		         b="금2A";
		         break;
		      case 29:
		         b="토2A";
		         break;
		      case 30:
		         b="월2B";
		         break;
		      case 31:
		         b="화2B";
		         break;
		      case 32:
		         b="수2B";
		         break;
		      case 33:
		         b="목2B";
		         break;
		      case 34:
		         b="금2B";
		         break;
		      case 35:
		         b="토2B";
		         break;
		      case 36:
		         b="월3A";
		         break;
		      case 37:
		         b="화3A";
		         break;
		      case 38:
		         b="수3A";
		         break;
		      case 39:
		         b="목3A";
		         break;
		      case 40:
		         b="금3A";
		         break;
		      case 41:
		         b="토3A";
		         break;
		      case 42:
		         b="월3B";
		         break;
		      case 43:
		         b="화3B";
		         break;
		      case 44:
		         b="수3B";
		         break;
		      case 45:
		         b="목3B";
		         break;
		      case 46:
		         b="금3B";
		         break;
		      case 47:
		         b="토3B";
		         break;
		      case 48:
		         b="월4A";
		         break;
		      case 49:
		         b="화4A";
		         break;
		      case 50:
		         b="수4A";
		         break;
		      case 51:
		         b="목4A";
		         break;
		      case 52:
		         b="금4A";
		         break;
		      case 53:
		         b="토4A";
		         break;
		      case 54:
		         b="월4B";
		         break;
		      case 55:
		         b="화4B";
		         break;
		      case 56:
		         b="수4B";
		         break;
		      case 57:
		         b="목4B";
		         break;
		      case 58:
		         b="금4B";
		         break;
		      case 59:
		         b="토4B";
		         break;
		      case 60:
		         b="월5A";
		         break;
		      case 61:
		         b="화5A";
		         break;
		      case 62:
		         b="수5A";
		         break;
		      case 63:
		         b="목5A";
		         break;
		      case 64:
		         b="금5A";
		         break;
		      case 65:
		         b="토5A";
		         break;
		      case 66:
		         b="월5B";
		         break;
		      case 67:
		         b="화5B";
		         break;
		      case 68:
		         b="수5B";
		         break;
		      case 69:
		         b="목5B";
		         break;
		      case 70:
		         b="금5B";
		         break;
		      case 71:
		         b="토5B";
		         break;
		      case 72:
		         b="월6A";
		         break;
		      case 73:
		         b="화6A";
		         break;
		      case 74:
		         b="수6A";
		         break;
		      case 75:
		         b="목6A";
		         break;
		      case 76:
		         b="금6A";
		         break;
		      case 77:
		         b="토6A";
		         break;
		      case 78:
		         b="월6B";
		         break;
		      case 79:
		         b="화6B";
		         break;
		      case 80:
		         b="수6B";
		         break;
		      case 81:
		         b="목6B";
		         break;
		      case 82:
		         b="금6B";
		         break;
		      case 83:
		         b="토6B";
		         break;
		      case 84:
		         b="월7A";
		         break;
		      case 85:
		         b="화7A";
		         break;
		      case 86:
		         b="수7A";
		         break;
		      case 87:
		         b="목7A";
		         break;
		      case 88:
		         b="금7A";
		         break;
		      case 89:
		         b="토7A";
		         break;
		      case 90:
		         b="월7B";
		         break;
		      case 91:
		         b="화7B";
		         break;
		      case 92:
		         b="수7B";
		         break;
		      case 93:
		         b="목7B";
		         break;
		      case 94:
		         b="금7B";
		         break;
		      case 95:
		         b="토7B";
		         break;
		      case 96:
		         b="월8A";
		         break;
		      case 97:
		         b="화8A";
		         break;
		      case 98:
		         b="수8A";
		         break;
		      case 99:
		         b="목8A";
		         break;
		      case 100:
		         b="금8A";
		         break;
		      case 101:
		         b="토8A";
		         break;
		      case 102:
		         b="월8B";
		         break;
		      case 103:
		         b="화8B";
		         break;
		      case 104:
		         b="수8B";
		         break;
		      case 105:
		         b="목8B";
		         break;
		      case 106:
		         b="금8B";
		         break;
		      case 107:
		         b="토8B";
		         break;
		      case 108:
		         b="월9A";
		         break;
		      case 109:
		         b="화9A";
		         break;
		      case 110:
		         b="수9A";
		         break;
		      case 111:
		         b="목9A";
		         break;
		      case 112:
		         b="금9A";
		         break;
		      case 113:
		         b="토9A";
		         break;
		      case 114:
		         b="월9B";
		         break;
		      case 115:
		         b="화9B";
		         break;
		      case 116:
		         b="수9B";
		         break;
		      case 117:
		         b="목9B";
		         break;
		      case 118:
		         b="금9B";
		         break;
		      case 119:
		         b="토9B";
		         break;
		      case 120:
		         b="월10A";
		         break;
		      case 121:
		         b="화10A";
		         break;
		      case 122:
		         b="수10A";
		         break;
		      case 123:
		         b="목10A";
		         break;
		      case 124:
		         b="금10A";
		         break;
		      case 125:
		         b="토10A";
		         break;
		      case 126:
		         b="월10B";
		         break;
		      case 127:
		         b="화10B";
		         break;
		      case 128:
		         b="수10B";
		         break;
		      case 129:
		         b="목10B";
		         break;
		      case 130:
		         b="금10B";
		         break;
		      case 131:
		         b="토10B";
		         break;
		      case 132:
		         b="월11A";
		         break;
		      case 133:
		         b="화11A";
		         break;
		      case 134:
		         b="수11A";
		         break;
		      case 135:
		         b="목11A";
		         break;
		      case 136:
		         b="금11A";
		         break;
		      case 137:
		         b="토11A";
		         break;
		      case 138:
		         b="월11B";
		         break;
		      case 139:
		         b="화11B";
		         break;
		      case 140:
		         b="수11B";
		         break;
		      case 141:
		         b="목11B";
		         break;
		      case 142:
		         b="금11B";
		         break;
		      case 143:
		         b="토11B";
		         break;
		      case 144:
		         b="월12A";
		         break;
		      case 145:
		         b="화12A";
		         break;
		      case 146:
		         b="수12A";
		         break;
		      case 147:
		         b="목12A";
		         break;
		      case 148:
		         b="금12A";
		         break;
		      case 149:
		         b="토12A";
		         break;
		      case 150:
		         b="월12B";
		         break;
		      case 151:
		         b="화12B";
		         break;
		      case 152:
		         b="수12B";
		         break;
		      case 153:
		         b="목12B";
		         break;
		      case 154:
		         b="금12B";
		         break;
		      case 155:
		         b="토12B";
		         break;
		      case 156:
		         b="월13A";
		         break;
		      case 157:
		         b="화13A";
		         break;
		      case 158:
		         b="수13A";
		         break;
		      case 159:
		         b="목13A";
		         break;
		      case 160:
		         b="금13A";
		         break;
		      case 161:
		         b="토13A";
		         break;
		      case 162:
		         b="월13B";
		         break;
		      case 163:
		         b="화13B";
		         break;
		      case 164:
		         b="수13B";
		         break;
		      case 165:
		         b="목13B";
		         break;
		      case 166:
		         b="금13B";
		         break;
		      case 167:
		         b="토13B";
		         break;
		      case 168:
		         b="월14A";
		         break;
		      case 169:
		         b="화14A";
		         break;
		      case 170:
		         b="수14A";
		         break;
		      case 171:
		         b="목14A";
		         break;
		      case 172:
		         b="금14A";
		         break;
		      case 173:
		         b="토14A";
		         break;
		      case 174:
		         b="월14B";
		         break;
		      case 175:
		         b="화14B";
		         break;
		      case 176:
		         b="수14B";
		         break;
		      case 177:
		         b="목14B";
		         break;
		      case 178:
		         b="금14B";
		         break;
		      case 179:
		         b="토14B";
		         break;
		      }
		      return b;
		   }
}
