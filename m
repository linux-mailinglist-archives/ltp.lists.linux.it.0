Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E769C17BACA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 11:53:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 330363C63D0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 11:53:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8A3643C6510
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:41:05 +0100 (CET)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66770601CDA
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:40:57 +0100 (CET)
Received: from localhost (unknown [192.168.167.245])
 by regular1.263xmail.com (Postfix) with ESMTP id C72C5106C;
 Thu,  5 Mar 2020 21:40:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from bj-wm-cp-10 (unknown [192.168.167.114])
 by smtp.263.net (postfix) whith ESMTP id
 P2881T139952594249472S1583415646389309_; 
 Thu, 05 Mar 2020 21:40:46 +0800 (CST)
X-UNIQUE-TAG: <3c224523a646363a298185595dda1660>
X-RL-SENDER: chenli@uniontech.com
X-SENDER: chenli@uniontech.com
X-LOGIN-NAME: wmsendmail@net263.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 192.168.167.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Thu, 5 Mar 2020 21:40:45 +0800 (CST)
From: =?UTF-8?B?TGkgQ2hlbg==?= <chenli@uniontech.com>
To: =?UTF-8?B?bHRw?= <ltp@lists.linux.it>
Message-ID: <1055212524.800413.1583415645668.JavaMail.xmail@bj-wm-cp-10>
MIME-Version: 1.0
X-Send-Individually: 0
X-Reply-Previous-EmailId: 
X-Priority: 3
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,SPF_HELO_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 06 Mar 2020 11:53:37 +0100
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
Content-Type: multipart/mixed; boundary="===============0103002927=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0103002927==
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
ZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPjE8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4m
bmJzcDsjZGVmaW5lIFRTS0lQPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj4z
MjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBw
eDsiPi1zdGF0aWMgREVGSU5FX1BDSV9ERVZJQ0VfVEFCTEUobHRwX3BjaV90YmwpID0gezwvcD48
cCBzdHlsZT0ibWFyZ2luOjBweDsiPitzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
bHRwX3BjaV90YmxbXSA9IHs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8c3BhbiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPnsgUENJX0RFVklDRShQQ0lfQU5ZX0lELCBQ
Q0lfQU5ZX0lEKSB9LDwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+eyAwLCB9PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4
OyI+Jm5ic3A7fTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij5AQCAtMTA0LDcgKzEwNCw3IEBA
IHN0YXRpYyBpbnQgcHJvYmVfcGNpX2Rldih1bnNpZ25lZCBpbnQgYnVzLCB1bnNpZ25lZCBpbnQg
c2xvdCk8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8c3BhbiBzdHlsZT0id2hpdGUt
c3BhY2U6cHJlIj4JCTwvc3Bhbj5sdHBfcGNpLmRldiA9IE5VTEw7PC9wPjxwIHN0eWxlPSJtYXJn
aW46MHB4OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj59PC9w
PjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+
LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+ZGV2ID0gcGNpX2dldF9idXNf
YW5kX3Nsb3QoYnVzLCBzbG90KTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4rPHNwYW4gc3R5
bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5kZXYgPSBwY2lfZ2V0X2RvbWFpbl9idXNfYW5k
X3Nsb3QocGNpX2RvbWFpbl9ucihkZXYtJmd0O2J1cyksIGJ1cywgc2xvdCk7PC9wPjxwIHN0eWxl
PSJtYXJnaW46MHB4OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bh
bj5pZiAoIWRldiB8fCAhZGV2LSZndDtkcml2ZXIpPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+
Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+cmV0dXJuIC1FTk9E
RVY7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7PC9wPjxwIHN0eWxlPSJtYXJnaW46
MHB4OyI+QEAgLTM2MCwyOSArMzYwLDYgQEAgc3RhdGljIGludCB0ZXN0X2J1c19hZGRfZGV2aWNl
cyh2b2lkKTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPgk8L3NwYW4+cmV0dXJuIFRGQUlMOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBw
eDsiPiZuYnNwO308L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8L3A+PHAgc3R5bGU9
Im1hcmdpbjowcHg7Ij4tLyo8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tICogdGVzdF9lbmFi
bGVfYnJpZGdlczwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi0gKjxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPgk8L3NwYW4+bWFrZSBjYWxsIHRvIHBjaV9lbmFibGVfYnJpZGdlcyw8L3A+
PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tICo8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4J
PC9zcGFuPnVzZSBidXMgcG9pbnRlciBmcm9tIHRoZSBsdHBfcGNpPC9wPjxwIHN0eWxlPSJtYXJn
aW46MHB4OyI+LSAqPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5zdHJ1Y3R1
cmU8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tICovPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4
OyI+LXN0YXRpYyBpbnQgdGVzdF9lbmFibGVfYnJpZGdlcyh2b2lkKTwvcD48cCBzdHlsZT0ibWFy
Z2luOjBweDsiPi17PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPgk8L3NwYW4+c3RydWN0IHBjaV9idXMgKmJ1cyA9IGx0cF9wY2kuYnVzOzwv
cD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi08L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPHNw
YW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5wcmtfaW5mbygiZW5hYmxlIGJyaWRn
ZXMiKTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4
OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+cGNpX2VuYWJsZV9icmlk
Z2VzKGJ1cyk7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTwvcD48cCBzdHlsZT0ibWFyZ2lu
OjBweDsiPi08c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPmlmIChidXMpIHs8
L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+
CQk8L3NwYW4+cHJrX2luZm8oImNhbGxlZCBlbmFibGUgYnJpZGdlcyIpOzwvcD48cCBzdHlsZT0i
bWFyZ2luOjBweDsiPi08c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5yZXR1
cm4gVFBBU1M7PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0ZS1z
cGFjZTpwcmUiPgk8L3NwYW4+fTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPi08L3A+PHAgc3R5
bGU9Im1hcmdpbjowcHg7Ij4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5w
cmtfZXJyKCJlbmFibGVfYnJpZGdlcyBmYWlsZWQiKTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7
Ij4tPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5yZXR1cm4gVEZBSUw7PC9w
PjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LX08L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4tPC9w
PjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+Jm5ic3A7Lyo8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7
Ij4mbmJzcDsgKiB0ZXN0X21hdGNoX2RldmljZTwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZu
YnNwOyAqPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5tYWtlIGNhbGwgdG8g
cGNpX21hdGNoX2RldmljZSwgcmV0dXJucyBhPC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+QEAg
LTYwOSw5ICs1ODYsNiBAQCBzdGF0aWMgaW50IHRlc3RfY2FzZSh1bnNpZ25lZCBpbnQgY21kKTwv
cD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpw
cmUiPgk8L3NwYW4+Y2FzZSBCVVNfQUREX0RFVklDRVM6PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4
OyI+Jm5ic3A7PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+cmMgPSB0ZXN0
X2J1c19hZGRfZGV2aWNlcygpOzwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPiZuYnNwOzxzcGFu
IHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPmJyZWFrOzwvcD48cCBzdHlsZT0ibWFy
Z2luOjBweDsiPi08c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPmNhc2UgRU5B
QkxFX0JSSURHRVM6PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+LTxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJjID0gdGVzdF9lbmFibGVfYnJpZGdlcygpOzwvcD48cCBz
dHlsZT0ibWFyZ2luOjBweDsiPi08c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bh
bj5icmVhazs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8c3BhbiBzdHlsZT0id2hp
dGUtc3BhY2U6cHJlIj4JPC9zcGFuPmNhc2UgTUFUQ0hfREVWSUNFOjwvcD48cCBzdHlsZT0ibWFy
Z2luOjBweDsiPiZuYnNwOzxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPnJj
ID0gdGVzdF9tYXRjaF9kZXZpY2UoKTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowcHg7Ij4mbmJzcDs8
c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5icmVhazs8L3A+PHAgc3R5bGU9
Im1hcmdpbjowcHg7Ij4tLSZuYnNwOzwvcD4=



--===============0103002927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0103002927==--
