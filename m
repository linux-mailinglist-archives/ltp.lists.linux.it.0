Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 418FF34A012
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 04:08:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C74F03C8E41
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 04:08:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B0BC13C1B7B
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 04:08:43 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.223])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 53BC21000DBD
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 04:08:41 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:42527.470603843
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-6173cb7efd254960b5825fc6d14a497e
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8B2DC2800DE;
 Fri, 26 Mar 2021 11:08:38 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 6173cb7efd254960b5825fc6d14a497e for
 xuyang2018.jy@fujitsu.com; Fri Mar 26 11:08:42 2021
X-Transaction-ID: 6173cb7efd254960b5825fc6d14a497e
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Fri, 26 Mar 2021 11:08:26 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
References: <1616726772-29562-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <605D4F1F.3020301@fujitsu.com>
X-Priority: 3
X-GUID: CB281459-1262-49BE-A0B2-4881862C3167
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <202103261108256329041@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallopt:fix compiling error
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1420722347=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============1420722347==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart071538303207_=----"

This is a multi-part message in MIME format.

------=_001_NextPart071538303207_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

VGhhbmtzLHBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4NCiANCkZyb206IHh1eWFuZzIwMTguanlA
ZnVqaXRzdS5jb20NCkRhdGU6IDIwMjEtMDMtMjYgMTE6MDMNClRvOiBYaW5wZW5nIExpdQ0KQ0M6
IGx0cEBsaXN0cy5saW51eC5pdA0KU3ViamVjdDogUmU6IFtMVFBdIFtQQVRDSF0gc3lzY2FsbHMv
bWFsbG9wdDpmaXggY29tcGlsaW5nIGVycm9yDQpIaSBMaXUNCj4gbWFsbG9wdDAxLmM6MzM6Mzog
d2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcHJpbnRfbWFsbGlu
Zm/igJkNCj4gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAgICBwcmludF9t
YWxsaW5mbygiVGVzdCB1b3JkYmxrcyIsJmluZm8pOw0KPiAgICAgICAgXg0KPiAvdG1wL2NjT1Uw
czdlLm86IEluIGZ1bmN0aW9uIGB0ZXN0X21hbGxvcHQnOg0KPiAvcm9vdC9teXdvcmsvbHRwX2dp
dGh1Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hbGxvcHQvbWFsbG9wdDAxLmM6Mzc6DQo+
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHByaW50X21hbGxpbmZvJw0KPiAvcm9vdC9teXdvcmsv
bHRwX2dpdGh1Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21hbGxvcHQvbWFsbG9wdDAxLmM6
MzM6DQo+IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHByaW50X21hbGxpbmZvJw0KVXN1YWxseSwg
aWYgZ2xpYmMgc3VwcG9ydHMgbWFsbG9wdCwgaXQgc2hvdWxkIGFsc28gc3VwcG9ydCBtYWxsaW5m
by4gU28gDQpJIGd1ZXNzIHlvdSBtZXQgdGhpcyBwcm9ibGVtIGJlY2F1c2UgeW91ciBjb21waWxl
IGVudmlyb21lbnQgd2F0IG5vdCBjbGVhbi4NClBsZWFzZSB0cnkgYWdhaW4gYXMgdGhlIGZvbGxv
d2luZyBzdGVwOg0KbWFrZSBkaXN0Y2xlYW4NCm1ha2UgYXV0b3Rvb2xzDQouL2NvbmZpZ3VyZQ0K
Y2QgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYWxsb3B0Lw0KbWFrZQ0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBYaW5wZW5nIExpdTxsaXV4cDExQGNoaW5hdGVsZWNvbS5jbj4NCj4gLS0tDQo+ICAg
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYWxsb3B0L21hbGxvcHQwMS5jIHwgMSArDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL21hbGxvcHQvbWFsbG9wdDAxLmMgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL21hbGxvcHQvbWFsbG9wdDAxLmMNCj4gaW5kZXggOGZmNDY0OS4uYmI3MjM0ZiAx
MDA2NDQNCj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYWxsb3B0L21hbGxvcHQw
MS5jDQo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWFsbG9wdC9tYWxsb3B0MDEu
Yw0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAgICAqLw0KPg0KPg0KPiArI2RlZmluZSBIQVZFX01B
TExJTkZPDQpXZSBoYXZlIGNoZWNrZWQgbWFsbGluZm8gZnVuY3Rpb24gaW4gY29uZmlndXJlLmFj
LiBXZSBuZXZlciBkZWZpbmUgdGhpcyANCmRpcmVjdGx5Lg0KPiAgICNpbmNsdWRlICIuLi9tYWxs
aW5mby9tYWxsaW5mb19jb21tb24uaCINCj4gICAjaW5jbHVkZSAidHN0X3NhZmVfbWFjcm9zLmgi
DQo+DQogDQpCZXN0IFJlZ2FyZHMNCllhbmcgWHUNCg==

------=_001_NextPart071538303207_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }p { margin-top: 0px; margin-botto=
m: 0px; }body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color:=
 rgb(0, 0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></spa=
n></div><div><span><div style=3D"margin: 10px;"><p class=3D"MsoNormal" sty=
le=3D"font-family: =E7=AD=89=E7=BA=BF; font-size: 10.5pt; line-height: nor=
mal; margin: 0cm; text-align: justify;">Thanks,please ignore this patch.</=
p></div></span></div>=0A<blockquote style=3D"margin-Top: 0px; margin-Botto=
m: 0px; margin-Left: 0.5em; margin-Right: inherit"><div>&nbsp;</div><div s=
tyle=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0=
cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;F=
ONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px;=
 PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:xuyang2018.jy@=
fujitsu.com">xuyang2018.jy@fujitsu.com</a></div><div><b>Date:</b>&nbsp;202=
1-03-26&nbsp;11:03</div><div><b>To:</b>&nbsp;<a href=3D"mailto:liuxp11@chi=
natelecom.cn">Xinpeng Liu</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:=
ltp@lists.linux.it">ltp@lists.linux.it</a></div><div><b>Subject:</b>&nbsp;=
Re: [LTP] [PATCH] syscalls/mallopt:fix compiling error</div></div></div><d=
iv><div>Hi Liu</div>=0A<div>&gt; mallopt01.c:33:3: warning: implicit decla=
ration of function =E2=80=98print_mallinfo=E2=80=99</div>=0A<div>&gt; [-Wi=
mplicit-function-declaration]</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp; pr=
int_mallinfo("Test uordblks",&amp;info);</div>=0A<div>&gt;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ^</div>=0A<div>&gt; /tmp/ccOU0s7e.o: In functio=
n `test_mallopt':</div>=0A<div>&gt; /root/mywork/ltp_github/testcases/kern=
el/syscalls/mallopt/mallopt01.c:37:</div>=0A<div>&gt; undefined reference =
to `print_mallinfo'</div>=0A<div>&gt; /root/mywork/ltp_github/testcases/ke=
rnel/syscalls/mallopt/mallopt01.c:33:</div>=0A<div>&gt; undefined referenc=
e to `print_mallinfo'</div>=0A<div>Usually, if glibc supports mallopt, it =
should also support mallinfo. So </div>=0A<div>I guess you met this proble=
m because your compile enviroment wat not clean.</div>=0A<div>Please try a=
gain as the following step:</div>=0A<div>make distclean</div>=0A<div>make =
autotools</div>=0A<div>./configure</div>=0A<div>cd testcases/kernel/syscal=
ls/mallopt/</div>=0A<div>make</div>=0A<div>&gt;</div>=0A<div>&gt; Signed-o=
ff-by: Xinpeng Liu&lt;liuxp11@chinatelecom.cn&gt;</div>=0A<div>&gt; ---</d=
iv>=0A<div>&gt;&nbsp;&nbsp; testcases/kernel/syscalls/mallopt/mallopt01.c =
| 1 +</div>=0A<div>&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+)</div>=
=0A<div>&gt;</div>=0A<div>&gt; diff --git a/testcases/kernel/syscalls/mall=
opt/mallopt01.c b/testcases/kernel/syscalls/mallopt/mallopt01.c</div>=0A<d=
iv>&gt; index 8ff4649..bb7234f 100644</div>=0A<div>&gt; --- a/testcases/ke=
rnel/syscalls/mallopt/mallopt01.c</div>=0A<div>&gt; +++ b/testcases/kernel=
/syscalls/mallopt/mallopt01.c</div>=0A<div>&gt; @@ -13,6 +13,7 @@</div>=0A=
<div>&gt;&nbsp;&nbsp;&nbsp; */</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=
=0A<div>&gt; +#define HAVE_MALLINFO</div>=0A<div>We have checked mallinfo =
function in configure.ac. We never define this </div>=0A<div>directly.</di=
v>=0A<div>&gt;&nbsp;&nbsp; #include "../mallinfo/mallinfo_common.h"</div>=
=0A<div>&gt;&nbsp;&nbsp; #include "tst_safe_macros.h"</div>=0A<div>&gt;</d=
iv>=0A<div>&nbsp;</div>=0A<div>Best Regards</div>=0A<div>Yang Xu</div>=0A<=
/div></blockquote>=0A</body></html>
------=_001_NextPart071538303207_=------


--===============1420722347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1420722347==--

