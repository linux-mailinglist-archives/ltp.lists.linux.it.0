Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2DF17B3A3
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 02:18:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4147E3C64D5
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 02:18:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 67FB43C201F
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 02:17:56 +0100 (CET)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 217A260076F
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 02:17:53 +0100 (CET)
Received: from localhost (unknown [192.168.167.137])
 by regular1.263xmail.com (Postfix) with ESMTP id 80FCF2E3;
 Fri,  6 Mar 2020 09:17:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from bj-wm-cp-10 (unknown [192.168.167.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32148T140661427377920S1583457469368977_; 
 Fri, 06 Mar 2020 09:17:49 +0800 (CST)
X-UNIQUE-TAG: <b092c53481c7bd7ea030ab5d82748eac>
X-RL-SENDER: chenli@uniontech.com
X-SENDER: chenli@uniontech.com
X-LOGIN-NAME: wmsendmail@net263.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 192.168.167.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Fri, 6 Mar 2020 09:17:49 +0800 (CST)
From: =?UTF-8?B?TGkgQ2hlbg==?= <chenli@uniontech.com>
To: =?UTF-8?B?bHRwIA==?= <ltp@lists.linux.it>
Message-ID: <1590663949.10863.1583457469070.JavaMail.xmail@bj-wm-cp-10>
References: <1055212524.800413.1583415645668.JavaMail.xmail@bj-wm-cp-10>
MIME-Version: 1.0
X-Send-Individually: 0
X-Reply-Previous-EmailId: 
X-SENDER-IP: 128.22.131.185
X-Priority: 3
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] =?utf-8?q?=5BPATCH=5D_Update_legacy_codes_in_ltp=5Ftpci=2E?=
 =?utf-8?q?c?=
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
Content-Type: multipart/mixed; boundary="===============0617567466=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0617567466==
Content-Type: text/html;  charset=utf-8
Content-Transfer-Encoding: base64

PHN0eWxlPnRhYmxlLmN1c3RvbVRhYmxlQ2xhc3NOYW1lIHttYXJnaW4tYm90dG9tOiAxMHB4O2Jv
cmRlci1jb2xsYXBzZTogY29sbGFwc2U7ZGlzcGxheTogdGFibGU7fS5jdXN0b21UYWJsZUNsYXNz
TmFtZSB0ZCwgLmN1c3RvbVRhYmxlQ2xhc3NOYW1lIHRoIHtib3JkZXI6IDFweCBzb2xpZCAjZGRk
O308L3N0eWxlPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+VGhlIGtlcm5lbCBhcGkgdXNlZCBpbiBs
dHBfdHBjaS5jIGlzIHRvbyBvbGQgYW5kIGNvbm5vdCBwYXNzIGNvbXBpbGU8YnI+PC9wPjxwIHN0
eWxlPSJtYXJnaW46MHB4OyI+YWZ0ZXIgMy4xMi48L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4t
LS08L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDsuLi4vZGV2aWNlLWRyaXZlcnMvcGNp
L3RwY2lfa2VybmVsL2x0cF90cGNpLmMgfCAzMCArKy0tLS0tLS0tLS0tLS0tLS0tPC9wPjxwIHN0
eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MjggZGVsZXRpb25zKC0pPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+PGJyPjwvcD48cCBzdHls
ZT0ibWFyZ2luOjBweDsiPmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2
ZXJzL3BjaS90cGNpX2tlcm5lbC9sdHBfdHBjaS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2Ut
ZHJpdmVycy9wY2kvdHBjaV9rZXJuZWwvbHRwX3RwY2kuYzwvcD48cCBzdHlsZT0ibWFyZ2luOjBw
eDsiPmluZGV4IDJjZjhjZWZjOC4uN2NiYWJmYWE1IDEwMDY0NDwvcD48cCBzdHlsZT0ibWFyZ2lu
OjBweDsiPi0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvcGNpL3RwY2lfa2Vy
bmVsL2x0cF90cGNpLmM8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4rKysgYi90ZXN0Y2FzZXMv
a2VybmVsL2RldmljZS1kcml2ZXJzL3BjaS90cGNpX2tlcm5lbC9sdHBfdHBjaS5jPC9wPjxwIHN0
eWxlPSJtYXJnaW46MHB4OyI+QEAgLTYxLDcgKzYxLDcgQEAgTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
OzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOyNkZWZpbmUgVEZBSUw8c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+MTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZu
YnNwOyNkZWZpbmUgVFNLSVA8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+MzI8
L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7
Ij4tc3RhdGljIERFRklORV9QQ0lfREVWSUNFX1RBQkxFKGx0cF9wY2lfdGJsKSA9IHs8L3A+PHAg
c3R5bGU9Im1hcmdpbjowcHg7Ij4rc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGx0
cF9wY2lfdGJsW10gPSB7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7PHNwYW4gc3R5
bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPnsgUENJX0RFVklDRShQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lEKSB9LDwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3
aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj57IDAsIH08L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4m
bmJzcDt9OzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPkBAIC0xMDQsNyArMTA0LDcgQEAgc3Rh
dGljIGludCBwcm9iZV9wY2lfZGV2KHVuc2lnbmVkIGludCBidXMsIHVuc2lnbmVkIGludCBzbG90
KTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFj
ZTpwcmUiPjwvc3Bhbj5sdHBfcGNpLmRldiA9IE5VTEw7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4
OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPn08L3A+PHAgc3R5
bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPHNwYW4g
c3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPmRldiA9IHBjaV9nZXRfYnVzX2FuZF9zbG90
KGJ1cywgc2xvdCk7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+KzxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPjwvc3Bhbj5kZXYgPSBwY2lfZ2V0X2RvbWFpbl9idXNfYW5kX3Nsb3QocGNp
X2RvbWFpbl9ucihkZXYtJmd0O2J1cyksIGJ1cywgc2xvdCk7PC9wPjxwIHN0eWxlPSJtYXJnaW46
MHB4OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPmlmICghZGV2
IHx8ICFkZXYtJmd0O2RyaXZlcik8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8c3Bh
biBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+cmV0dXJuIC1FTk9ERVY7PC9wPjxwIHN0
eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+QEAgLTM2
MCwyOSArMzYwLDYgQEAgc3RhdGljIGludCB0ZXN0X2J1c19hZGRfZGV2aWNlcyh2b2lkKTwvcD48
cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUi
Pjwvc3Bhbj5yZXR1cm4gVEZBSUw7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7fTwv
cD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsi
Pi0vKjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi0gKiB0ZXN0X2VuYWJsZV9icmlkZ2VzPC9w
PjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LSAqPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+
PC9zcGFuPm1ha2UgY2FsbCB0byBwY2lfZW5hYmxlX2JyaWRnZXMsPC9wPjxwIHN0eWxlPSJtYXJn
aW46MHB4OyI+LSAqPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPnVzZSBidXMg
cG9pbnRlciBmcm9tIHRoZSBsdHBfcGNpPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LSAqPHNw
YW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPnN0cnVjdHVyZTwvcD48cCBzdHlsZT0i
bWFyZ2luOjBweDsiPi0gKi88L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tc3RhdGljIGludCB0
ZXN0X2VuYWJsZV9icmlkZ2VzKHZvaWQpPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LXs8L3A+
PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9z
cGFuPnN0cnVjdCBwY2lfYnVzICpidXMgPSBsdHBfcGNpLmJ1czs8L3A+PHAgc3R5bGU9Im1hcmdp
bjowcHg7Ij4tPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1z
cGFjZTpwcmUiPjwvc3Bhbj5wcmtfaW5mbygiZW5hYmxlIGJyaWRnZXMiKTs8L3A+PHAgc3R5bGU9
Im1hcmdpbjowcHg7Ij4tPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3
aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5wY2lfZW5hYmxlX2JyaWRnZXMoYnVzKTs8L3A+PHAgc3R5
bGU9Im1hcmdpbjowcHg7Ij4tPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5pZiAoYnVzKSB7PC9wPjxwIHN0eWxlPSJtYXJnaW46
MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5wcmtfaW5mbygiY2Fs
bGVkIGVuYWJsZSBicmlkZ2VzIik7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0
eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5yZXR1cm4gVFBBU1M7PC9wPjxwIHN0eWxlPSJt
YXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj59PC9wPjxw
IHN0eWxlPSJtYXJnaW46MHB4OyI+LTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi08c3BhbiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+cHJrX2VycigiZW5hYmxlX2JyaWRnZXMgZmFp
bGVkIik7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFj
ZTpwcmUiPjwvc3Bhbj5yZXR1cm4gVEZBSUw7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LX08
L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5i
c3A7Lyo8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDsgKiB0ZXN0X21hdGNoX2Rldmlj
ZTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOyAqPHNwYW4gc3R5bGU9IndoaXRlLXNw
YWNlOnByZSI+PC9zcGFuPm1ha2UgY2FsbCB0byBwY2lfbWF0Y2hfZGV2aWNlLCByZXR1cm5zIGE8
L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij5AQCAtNjA5LDkgKzU4Niw2IEBAIHN0YXRpYyBpbnQg
dGVzdF9jYXNlKHVuc2lnbmVkIGludCBjbWQpPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5i
c3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPmNhc2UgQlVTX0FERF9ERVZJ
Q0VTOjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1z
cGFjZTpwcmUiPjwvc3Bhbj5yYyA9IHRlc3RfYnVzX2FkZF9kZXZpY2VzKCk7PC9wPjxwIHN0eWxl
PSJtYXJnaW46MHB4OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFu
PmJyZWFrOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi08c3BhbiBzdHlsZT0id2hpdGUtc3Bh
Y2U6cHJlIj48L3NwYW4+Y2FzZSBFTkFCTEVfQlJJREdFUzo8L3A+PHAgc3R5bGU9Im1hcmdpbjow
cHg7Ij4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPnJjID0gdGVzdF9lbmFi
bGVfYnJpZGdlcygpOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi08c3BhbiBzdHlsZT0id2hp
dGUtc3BhY2U6cHJlIj48L3NwYW4+YnJlYWs7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5i
c3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPmNhc2UgTUFUQ0hfREVWSUNF
OjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFj
ZTpwcmUiPjwvc3Bhbj5yYyA9IHRlc3RfbWF0Y2hfZGV2aWNlKCk7PC9wPjxwIHN0eWxlPSJtYXJn
aW46MHB4OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPmJyZWFr
OzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi0tJm5ic3A7PC9wPg==



--===============0617567466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0617567466==--
