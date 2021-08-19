package com.jhta.neocom.mapper;




import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.AdvBoardVo;




public interface AdvBoardMapper {
int create (AdvBoardVo vo);
List<AdvBoardVo> list();
int delete (int adv_board_no);
int update (AdvBoardVo vo);
AdvBoardVo find (int adv_board_no);

}
