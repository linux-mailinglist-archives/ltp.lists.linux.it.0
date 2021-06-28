Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AE3B57F7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:58:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B1BC3C76D7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:58:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 660C73C291C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:58:04 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.199])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 40B591000402
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:58:02 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 9AA0E11D8
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 11:58:00 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from uos-pc (unknown [113.200.76.118])
 by smtp.263.net (postfix) whith ESMTP id
 P5175T139827863340800S1624852660197046_; 
 Mon, 28 Jun 2021 11:58:00 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <969d7b29aac56c17dcda0c2b6debfcc5>
X-RL-SENDER: gouhao@uniontech.com
X-SENDER: gouhao@uniontech.com
X-LOGIN-NAME: gouhao@uniontech.com
X-FST-TO: liwang@redhat.com
X-RCPT-COUNT: 4
X-SENDER-IP: 113.200.76.118
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date: Mon, 28 Jun 2021 11:57:40 +0800
From: gouhao@uniontech.com
To: liwang@redhat.com
Message-Id: <20210628115740.5da3dbfda1c263f95d66c77a@uniontech.com>
UOS-MsgId: <1624852660068-0>
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=HTML_MESSAGE,MIME_HTML_ONLY,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] =?gb2312?b?u9i4tKO6UmU6IFJlOiAgW1BBVENIXSBmaXggY3B1aG90?=
 =?gb2312?b?cGx1ZzA0IGNoZWNrIGxhc3QgY3B1IGVycm9y?=
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: weidong@uniontech.com, jiaofenfang@uniontech.com, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0196449777=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0196449777==
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html xmlns='http://www.w3.org/1999/xhtml'> <head><meta http-equiv='content-type' content='text/html;charset=utf-8'></head><body><div><div id="MailBelowDiv"></div><div style="word-wrap: break-word;"><div>This change makes sense.</div><div><br></div><div>On my computer, the last CPU can't be offline, which causes the execution of this testcase to fail.</div><div><br></div><div>However, the testcase makes special treatment to the last CPU. If the last CPU cannot be offline, the execution result of the testcase should not be affected.</div><div><br></div><div>Therefore, if cpu0 does not have an online file, it will lead to an error in the judgment of the last CPU.<br><div id="sign"><hr width="300" align="left"><p style="font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px; background: rgb(254, 254, 254);"><strong><span style="font-size: 13.5pt;">统信软件技术有限公司</span></strong><span lang="EN-US">&nbsp;&nbsp; &nbsp;</span></p><p style="font-family: tah
 oma, arial, helvetica, sans-serif; font-size: 12px; background: rgb(254, 254, 254);"><strong><span lang="EN-US" style="font-size: 7.5pt;">UnionTech Software Technology Co., Ltd.&nbsp;</span></strong><span style="font-size: 10pt;">　</span></p><p style="font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px; background: rgb(254, 254, 254);"><span style="background-color: rgb(255, 255, 255); font-size: 10pt;">官网：</span><span lang="EN-US" style="background-color: rgb(255, 255, 255); font-size: 10pt; font-family: Tahoma, sans-serif;">www.uniontech.com</span><span style="font-size: 9pt; background-color: rgb(255, 255, 255);">　　</span></p><p style="background-color: rgb(255, 255, 255); font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px;"><br></p><div style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><span style="font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px;">此电子邮件消息仅供预期收件人�
 ��用，其中可能包含保密或特权使用信息。如果您不是预期收件人，请勿使用、传播、分发或复制此电子邮件或信赖此邮件采取任何行动。如果您误收了此邮件，请立即回复邮件通知统信软件技术有限公司发件人，并删除误收电子邮件及其相关附件。感谢配合！</span>&nbsp;&nbsp;</div><div style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><span style="font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px;"><br></span>&nbsp;</div><div style="color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);"><span style="font-family: tahoma, arial, helvetica, sans-serif; font-size: 12px;">This email message is intended only for the use of the individual or entity who/which is the intended recipient and may contain information that is privileged or confidential. If you are not the intended recipient, you are hereby notified that any use, dissemination, distribution or
  copying of, or taking any action in reliance on, this e-mail is strictly prohibited. If you have received this email in error, please notify UnionTech Software Technology&nbsp; immediately by replying to this e-mail and immediately delete and discard all copies of the e-mail and the attachment thereto (if any). Thank you.</span>&nbsp;&nbsp;</div></div></div>------------------------------------------------------------------<div><br></div></div><div id="summernote"><div id="MailBelowDiv"></div></div><div dir="ltr"><div dir="ltr"><div style="font-size:small" class="gmail_default"><br></div></div><br><div class="gmail_quote"><div class="gmail_attr" dir="ltr">On Mon, Jun 28, 2021 at 11:03 AM &lt;<a href="mailto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt; wrote:<br></div><blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class="gmail_quote"> <div><div><div id="gmail-m_-2047747051835399752MailBelowDiv"></div><div style="over
 flow-wrap: break-word;"><div>hi, LiWang,</div><div><br></div><div>My cpu is&nbsp;Hygon C86 7185 32-core Processor, x86_64 architecture， kernel is 4.19.90</div><div>Only cpu0 has no files，It doesn't seem to have anything to do with the kernel. I tried other kernels, too</div></div></div></div></blockquote><div><br></div><div><div style="font-size:small" class="gmail_default">Thanks for the info.</div><div style="font-size:small" class="gmail_default"><br></div><div style="font-size:small" class="gmail_default">I checked my laptop (5.12.11-300.fc34.x86_64), it has no 'online' file in the first cpu0 as well.</div>It <span style="font-size:small" class="gmail_default">seems common to consider</span>&nbsp;cpu0 is always online, so it won’t have “cpu0/online”.</div><div><div style="font-size:small" class="gmail_default">(I got this view from google search ^)</div><br></div><div><div style="font-size:small" class="gmail_default"><br></div><div style="font-size:small" clas
 s="gmail_default">But go back to your patch, does it really make sense to correct</div><div style="font-size:small" class="gmail_default">the judgment of the last CPU?</div><div style="font-size:small" class="gmail_default"><br></div><div style="font-size:small" class="gmail_default">If I understand correctly, the original judgment is purposely to</div><div style="font-size:small" class="gmail_default">guarantee&nbsp;all CPUs can be safely offline, so if there is already</div><div style="font-size:small" class="gmail_default">a cpu0 without&nbsp;an 'online' file, it will be filtered&nbsp;out, right? This</div><div style="font-size:small" class="gmail_default">means all of the remaining hotplugged&nbsp;CPUs can be offline safely.&nbsp;</div><div style="font-size:small" class="gmail_default">In&nbsp;this case, the judgment of the last CPU is losing effect as</div><div style="font-size:small" class="gmail_default">expected. Why should we correct it?</div><div style="font-size:s
 mall" class="gmail_default"><br></div><div style="font-size:small" class="gmail_default">Or, do you get any failures/abnormal in&nbsp;testing?</div><br></div><div>&nbsp;</div><blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class="gmail_quote"><div><div><div style="overflow-wrap: break-word;"><div><br></div><div>Attached is a screenshot.<br><div id="gmail-m_-2047747051835399752sign"><hr align="left" width="300"><p style="font-family:tahoma,arial,helvetica,sans-serif;font-size:12px;background:rgb(254,254,254)"><strong><span style="font-size:13.5pt">统信软件技术有限公司</span></strong><span lang="EN-US">&nbsp;&nbsp; &nbsp;</span></p><p style="font-family:tahoma,arial,helvetica,sans-serif;font-size:12px;background:rgb(254,254,254)"><strong><span style="font-size:7.5pt" lang="EN-US">UnionTech Software Technology Co., Ltd.&nbsp;</span></strong><span style="font-size:10pt">　</span></p><p style="font-family:tahoma,aria
 l,helvetica,sans-serif;font-size:12px;background:rgb(254,254,254)"><span style="background-color:rgb(255,255,255);font-size:10pt">官网：</span><span style="background-color:rgb(255,255,255);font-size:10pt;font-family:Tahoma,sans-serif" lang="EN-US"><a href="http://www.uniontech.com">www.uniontech.com</a></span><span style="font-size:9pt;background-color:rgb(255,255,255)">　　</span></p><p style="background-color:rgb(255,255,255);font-family:tahoma,arial,helvetica,sans-serif;font-size:12px"><br></p><div style="color:rgb(51,51,51);background-color:rgb(255,255,255)"><span style="font-family:tahoma,arial,helvetica,sans-serif;font-size:12px">此电子邮件消息仅供预期收件人使用，其中可能包含保密或特权使用信息。如果您不是预期收件人，请勿使用、传播、分发或复制此电子邮件或信赖此邮件采取任何行动。如果您误收了此邮件，请立即回复邮件通知统信软件技术有限公司发件人，并删除误收
 电子邮件及其相关附件。感谢配合！</span>&nbsp;&nbsp;</div><div style="color:rgb(51,51,51);background-color:rgb(255,255,255)"><span style="font-family:tahoma,arial,helvetica,sans-serif;font-size:12px"><br></span>&nbsp;</div><div style="color:rgb(51,51,51);backgrou
nd-color:rgb(255,255,255)"><span style="font-family:tahoma,arial,helvetica,sans-serif;font-size:12px">This email message is intended only for the use of the individual or entity who/which is the intended recipient and may contain information that is privileged or confidential. If you are not the intended recipient, you are hereby notified that any use, dissemination, distribution or copying of, or taking any action in reliance on, this e-mail is strictly prohibited. If you have received this email in error, please notify UnionTech Software Technology&nbsp; immediately by replying to this e-mail and immediately delete and discard all copies of the e-mail and the attachment thereto (if any). Thank you.</span>&nbsp;&nbsp;</div></div></div>------------------------------------------------------------------<div><br></div></div><div id="gmail-m_-2047747051835399752summernote"><div id="gmail-m_-2047747051835399752MailBelowDiv"></div></div><div dir="ltr"><div dir="ltr"><div style="fon
 t-size:small">Hi Hao,</div></div><br><div class="gmail_quote"><div dir="ltr" class="gmail_attr">On Mon, Jun 28, 2021 at 9:16 AM Gou Hao &lt;<a href="mailto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt; wrote:<br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: gouhao &lt;<a href="mailto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt;<br>
<br></blockquote><div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cpuhotplug04 uses get_hotplug_cpus when traversing, <br>
get_hotplug_cpus will filter out cpu without online files, <br>
and $cpus_num will be used to determine the last cpu num。</blockquote><div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
If some cpu do not have an online file, <br>
it will lead to an error in the judgment of the last cpu.<br></blockquote><div><br></div><div><div style="font-size:small">I'm wondering&nbsp;what kind of CPU does not have the online file, and which</div><div style="font-size:small">kernel version is being used? Is that test machine an x86 or MIPS?</div></div></div><div><br></div>-- <br><div dir="ltr"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>
 </div></div>
</blockquote></div><br clear="all"><div><br></div>-- <br><div class="gmail_signature" dir="ltr"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>
 </div></body></html>



--===============0196449777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0196449777==--
