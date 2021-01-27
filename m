Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBD3057C0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:04:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6AE53C79F7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:04:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DF6B83C002E
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:04:47 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.223])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 75AC32009C9
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:04:41 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.92:24287.1558508429
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.243?logid-810a0f42667747698cf49e6393b0ceb1
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 97DB92800A8;
 Wed, 27 Jan 2021 18:04:35 +0800 (CST)
X-189-SAVE-TO-SEND: liuxp11@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 810a0f42667747698cf49e6393b0ceb1 for chrubis@suse.cz; 
 Wed Jan 27 18:04:38 2021
X-Transaction-ID: 810a0f42667747698cf49e6393b0ceb1
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Wed, 27 Jan 2021 18:04:35 +0800
From: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
To: "Cyril Hrubis" <chrubis@suse.cz>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>, 
 <YBE03REJywKIlM0X@yuki.lan>
X-Priority: 3
X-GUID: 64C4ABD7-40EC-4957-AAD9-6F506BCD8597
X-Has-Attach: no
X-Mailer: Foxmail 7.2.18.111[cn]
Mime-Version: 1.0
Message-ID: <2021012718043566596022@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Content-Type: multipart/mixed; boundary="===============2112211482=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.

--===============2112211482==
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart075624832516_=----"

This is a multi-part message in MIME format.

------=_001_NextPart075624832516_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

W3Jvb3RAdGVzdC1lbnYtbm0wNS1jb21wdXRlLTE0ZTVlNzJlMzggfl0jIGNhdCAvcHJvYy9tZW1p
bmZvDQpNZW1Ub3RhbDogICAgICAgNTI2OTk3NDIwIGtCDQpNZW1GcmVlOiAgICAgICAgNTIwMjI0
OTA4IGtCDQpNZW1BdmFpbGFibGU6ICAgNTE5OTM2NzQ0IGtCDQpCdWZmZXJzOiAgICAgICAgICAg
ICAgIDAga0INCkNhY2hlZDogICAgICAgICAgMjUwOTAzNiBrQg0KU3dhcENhY2hlZDogICAgICAg
ICAgICAwIGtCDQpBY3RpdmU6ICAgICAgICAgICA5MDY4Njgga0INCkluYWN0aXZlOiAgICAgICAg
MjM5ODA4NCBrQg0KQWN0aXZlKGFub24pOiAgICAgODE2Mzk2IGtCDQpJbmFjdGl2ZShhbm9uKTog
ICAgNzcyMzYga0INCkFjdGl2ZShmaWxlKTogICAgICA5MDQ3MiBrQg0KSW5hY3RpdmUoZmlsZSk6
ICAyMzIwODQ4IGtCDQpVbmV2aWN0YWJsZTogICAgICA2MTAwNTYga0INCk1sb2NrZWQ6ICAgICAg
ICAgIDYxMDA1NiBrQg0KU3dhcFRvdGFsOiAgICAgICAgICAgICAwIGtCDQpTd2FwRnJlZTogICAg
ICAgICAgICAgIDAga0INCkRpcnR5OiAgICAgICAgICAgICAgICAgMCBrQg0KV3JpdGViYWNrOiAg
ICAgICAgICAgICAwIGtCDQpBbm9uUGFnZXM6ICAgICAgIDE0MDYzMzYga0INCk1hcHBlZDogICAg
ICAgICAgIDExODYyOCBrQg0KU2htZW06ICAgICAgICAgICAgIDg0NDAwIGtCDQpLUmVjbGFpbWFi
bGU6ICAgICAxOTM3NTIga0INClNsYWI6ICAgICAgICAgICAgIDcwMzY2OCBrQg0KU1JlY2xhaW1h
YmxlOiAgICAgMTkzNzUyIGtCDQpTVW5yZWNsYWltOiAgICAgICA1MDk5MTYga0INCktlcm5lbFN0
YWNrOiAgICAgICAxMjY3MiBrQg0KUGFnZVRhYmxlczogICAgICAgIDE0MDU2IGtCDQpORlNfVW5z
dGFibGU6ICAgICAgICAgIDAga0INCkJvdW5jZTogICAgICAgICAgICAgICAgMCBrQg0KV3JpdGVi
YWNrVG1wOiAgICAgICAgICAwIGtCDQpDb21taXRMaW1pdDogICAgMjYzNDk4NzA4IGtCDQpDb21t
aXR0ZWRfQVM6ICAgMTAyNjM3NjAga0INClZtYWxsb2NUb3RhbDogICAzNDM1OTczODM2NyBrQg0K
Vm1hbGxvY1VzZWQ6ICAgICAgNjUxNzU2IGtCDQpWbWFsbG9jQ2h1bms6ICAgICAgICAgIDAga0IN
ClBlcmNwdTogICAgICAgICAgICA2MjQ2NCBrQg0KSGFyZHdhcmVDb3JydXB0ZWQ6ICAgIDg4IGtC
DQpBbm9uSHVnZVBhZ2VzOiAgICAgICAgIDAga0INClNobWVtSHVnZVBhZ2VzOiAgICAgICAgMCBr
Qg0KU2htZW1QbWRNYXBwZWQ6ICAgICAgICAwIGtCDQpGaWxlSHVnZVBhZ2VzOiAgICAgICAgIDAg
a0INCkZpbGVQbWRNYXBwZWQ6ICAgICAgICAgMCBrQg0KQ21hVG90YWw6ICAgICAgICAgICAgICAw
IGtCDQpDbWFGcmVlOiAgICAgICAgICAgICAgIDAga0INCkh1Z2VQYWdlc19Ub3RhbDogICAgICAg
MA0KSHVnZVBhZ2VzX0ZyZWU6ICAgICAgICAwDQpIdWdlUGFnZXNfUnN2ZDogICAgICAgIDANCkh1
Z2VQYWdlc19TdXJwOiAgICAgICAgMA0KSHVnZXBhZ2VzaXplOiAgICAgICAyMDQ4IGtCDQpIdWdl
dGxiOiAgICAgICAgICAgICAgIDAga0INCkRpcmVjdE1hcDRrOiAgICAgMTM3MTgwOCBrQg0KRGly
ZWN0TWFwMk06ICAgIDQ5NjYxOTUyIGtCDQpEaXJlY3RNYXAxRzogICAgNDg2NTM5MjY0IGtCDQoN
Cltyb290QHRlc3QtZW52LW5tMDUtY29tcHV0ZS0xNGU1ZTcyZTM4IH5dIyBjYXQgIC9wcm9jL3N5
cy92bS9taW5fZnJlZV9rYnl0ZXMNCjkwMTEyDQoNCg0KDQoNCiANCkZyb206IEN5cmlsIEhydWJp
cw0KRGF0ZTogMjAyMS0wMS0yNyAxNzozOQ0KVG86IFhpbnBlbmcgTGl1DQpDQzogbHRwDQpTdWJq
ZWN0OiBSZTogW0xUUF0gW1BBVENIIDEvMl0gc3lzY2FsbHMvaW9jdGw6IGlvY3RsX3NnMDEuYzog
aW9jdGxfc2cwMSBpbnZva2VkIG9vbS1raWxsZXINCkhpIQ0KPiBNZW1Ub3RhbDogICAgICAgMTk4
MTAxNzQ0IGtCDQo+IE1lbUZyZWU6ICAgICAgICAxODkzMDMxNDgga0INCj4gTWVtQXZhaWxhYmxl
OiAgIDE4ODU2NjczMiBrQg0KIA0KVGhpcyBzb3VuZHMgcmVhbGx5IHN0cmFuZ2UsIHVzdWFsbHkg
TWVtRnJlZSBpcyBzbWFsbGVyIHRoYW4gTWVtQXZhaWxhYmxlDQpzaW5jZSBNZW1GcmVlIGRvZXMg
bm90IGluY2x1ZGUgcGFnZSBjYWNoZS4NCiANCklzIHRoaXMgZnJlc2hseSBib290ZWQgc3lzdGVt
Pw0KIA0KQ2FuIHlvdSBzZW5kIHRoZSB3aG9sZSBtZW1pbmZvIGhlcmUgcGxlYXNlPw0KIA0KLS0g
DQpDeXJpbCBIcnViaXMNCmNocnViaXNAc3VzZS5jeg0K

------=_001_NextPart075624832516_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font=
-family: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</s=
tyle></head><body>=0A<div><span></span><div>[root@test-env-nm05-compute-14=
e5e72e38 ~]# cat /proc/meminfo</div><div>MemTotal: &nbsp; &nbsp; &nbsp; 52=
6997420 kB</div><div>MemFree: &nbsp; &nbsp; &nbsp; &nbsp;520224908 kB</div=
><div>MemAvailable: &nbsp; 519936744 kB</div><div>Buffers: &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</div><div>Cached: &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;2509036 kB</div><div>SwapCached: &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;0 kB</div><div>Active: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 906868 kB</div><div>Inactive: &nbsp; &nbsp; &nbsp; &nbsp;2398084 kB</div>=
<div>Active(anon): &nbsp; &nbsp; 816396 kB</div><div>Inactive(anon): &nbsp=
; &nbsp;77236 kB</div><div>Active(file): &nbsp; &nbsp; &nbsp;90472 kB</div=
><div>Inactive(file): &nbsp;2320848 kB</div><div>Unevictable: &nbsp; &nbsp=
; &nbsp;610056 kB</div><div>Mlocked: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;610=
056 kB</div><div>SwapTotal: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 kB=
</div><div>SwapFree: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB<=
/div><div>Dirty: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0=
 kB</div><div>Writeback: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</d=
iv><div>AnonPages: &nbsp; &nbsp; &nbsp; 1406336 kB</div><div>Mapped: &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; 118628 kB</div><div>Shmem: &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; 84400 kB</div><div>KReclaimable: &nbsp; &nbsp; 19=
3752 kB</div><div>Slab: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 703668 k=
B</div><div>SReclaimable: &nbsp; &nbsp; 193752 kB</div><div>SUnreclaim: &n=
bsp; &nbsp; &nbsp; 509916 kB</div><div>KernelStack: &nbsp; &nbsp; &nbsp; 1=
2672 kB</div><div>PageTables: &nbsp; &nbsp; &nbsp; &nbsp;14056 kB</div><di=
v>NFS_Unstable: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB</div><div>Bounce: &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB</div><div>Write=
backTmp: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB</div><div>CommitLimit: &nb=
sp; &nbsp;263498708 kB</div><div>Committed_AS: &nbsp; 10263760 kB</div><di=
v>VmallocTotal: &nbsp; 34359738367 kB</div><div>VmallocUsed: &nbsp; &nbsp;=
 &nbsp;651756 kB</div><div>VmallocChunk: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;0 kB</div><div>Percpu: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;62464 kB<=
/div><div>HardwareCorrupted: &nbsp; &nbsp;88 kB</div><div>AnonHugePages: &=
nbsp; &nbsp; &nbsp; &nbsp; 0 kB</div><div>ShmemHugePages: &nbsp; &nbsp; &n=
bsp; &nbsp;0 kB</div><div>ShmemPmdMapped: &nbsp; &nbsp; &nbsp; &nbsp;0 kB<=
/div><div>FileHugePages: &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</div><div>FilePm=
dMapped: &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</div><div>CmaTotal: &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 kB</div><div>CmaFree: &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 kB</div><div>HugePages_Total: &nbsp; =
&nbsp; &nbsp; 0</div><div>HugePages_Free: &nbsp; &nbsp; &nbsp; &nbsp;0</di=
v><div>HugePages_Rsvd: &nbsp; &nbsp; &nbsp; &nbsp;0</div><div>HugePages_Su=
rp: &nbsp; &nbsp; &nbsp; &nbsp;0</div><div>Hugepagesize: &nbsp; &nbsp; &nb=
sp; 2048 kB</div><div>Hugetlb: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 0 kB</div><div>DirectMap4k: &nbsp; &nbsp; 1371808 kB</div><div>Direc=
tMap2M: &nbsp; &nbsp;49661952 kB</div><div>DirectMap1G: &nbsp; &nbsp;48653=
9264 kB</div></div><div><br></div><div><div>[root@test-env-nm05-compute-14=
e5e72e38 ~]# cat &nbsp;/proc/sys/vm/min_free_kbytes</div><div>90112</div><=
/div><div><br></div><div><br></div><div><br></div><div><br></div>=0A<block=
quote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em; ma=
rgin-Right: inherit"><div>&nbsp;</div><div style=3D"border:none;border-top=
:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGH=
T: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#00000=
0; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>Fro=
m:</b>&nbsp;<a href=3D"mailto:chrubis@suse.cz">Cyril Hrubis</a></div><div>=
<b>Date:</b>&nbsp;2021-01-27&nbsp;17:39</div><div><b>To:</b>&nbsp;<a href=
=3D"mailto:liuxp11@chinatelecom.cn">Xinpeng Liu</a></div><div><b>CC:</b>&n=
bsp;<a href=3D"mailto:ltp@lists.linux.it">ltp</a></div><div><b>Subject:</b=
>&nbsp;Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invo=
ked oom-killer</div></div></div><div><div>Hi!</div>=0A<div>&gt; MemTotal:&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 198101744 kB</div>=0A<div>&gt; MemFree=
:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 189303148 kB</div>=0A<div>&gt;=
 MemAvailable:&nbsp;&nbsp; 188566732 kB</div>=0A<div>&nbsp;</div>=0A<div>T=
his sounds really strange, usually MemFree is smaller than MemAvailable</d=
iv>=0A<div>since MemFree does not include page cache.</div>=0A<div>&nbsp;<=
/div>=0A<div>Is this freshly booted system?</div>=0A<div>&nbsp;</div>=0A<d=
iv>Can you send the whole meminfo here please?</div>=0A<div>&nbsp;</div>=
=0A<div>-- </div>=0A<div>Cyril Hrubis</div>=0A<div>chrubis@suse.cz</div>=
=0A</div></blockquote>=0A</body></html>
------=_001_NextPart075624832516_=------


--===============2112211482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2112211482==--

