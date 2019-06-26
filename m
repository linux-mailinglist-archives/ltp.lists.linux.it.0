Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A531B565EE
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:51:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F4E93C104D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:51:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 07A203C0271
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:51:15 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7661600C63
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:51:15 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5Q9oclQ003517
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 26 Jun 2019 02:50:48 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 26 Jun 2019 02:50:27 -0700
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <a361073f-3fbd-13af-b688-01da6b443b22@windriver.com>
Date: Wed, 26 Jun 2019 17:50:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] Bug Report: fs_fill: fails on btrfs with "ENOSPC" when disk
 size = 512M
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
Content-Type: multipart/mixed; boundary="===============0583112765=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0583112765==
Content-Type: multipart/alternative;
	boundary="------------4AEBAEFECEFBF27C54CD801D"
Content-Language: en-US

--------------4AEBAEFECEFBF27C54CD801D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,


      Description:

fs_fill fails on Btrfs when /dev/loop//*size = 512M*/.
I tested other size, 256M 1G, all passed.


      Kernel:

v5.2-rc1, qemux86-64

|# make -j40 ARCH=x86_64 CROSS_COMPILE=x86-64-gcc use qemu to bootup kernel |


      LTP:

master branch: date 20190625


      Reproduce:

|build ltp source and cp ltp all outputs to qemu # vi runltp in 
function: create_block() dd if=/dev/zero of=${TMP}/test.img bs=1024 
count=262144 ---> dd if=/dev/zero of=${TMP}/test.img bs=1024 
count=524288 # runltp -f fs -s fs_fill |


      Issue:

The issue maybe not reproduced everytime but four fifths chance.

|safe_macros.c:358: BROK: fs_fill.c:67: unlink(mntpoint/thread9/file0) 
failed: ENOSPC safe_macros.c:358: BROK: fs_fill.c:67: 
unlink(mntpoint/thread4/file0) failed: ENOSPC [ 154.762502] BTRFS 
warning (device loop0): could not allocate space for a delete; will 
truncate on mount [ 155.691577] BTRFS warning (device loop0): could not 
allocate space for a delete; will truncate on mount [ 156.017697] BTRFS 
warning (device loop0): could not allocate space for a delete; will 
truncate on mount |


      Analysis:

One new kernel commit contained in v5.2-rc1 introduces the issue.

|commit c8eaeac7b734347c3afba7008b7af62f37b9c140 Author: Josef Bacik 
<josef@toxicpanda.com> Date: Wed Apr 10 15:56:10 2019 -0400 btrfs: 
reserve delalloc metadata differently ...|


Anyone's reply will be appreciated.

--Hongzhi

||

--------------4AEBAEFECEFBF27C54CD801D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogIDwvaGVhZD4KICA8Ym9keSB0
ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxwPkhpIGFsbCw8L3A+CiAg
ICA8aDMgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IG1hcmdpbi1ib3R0b206IDE2
cHg7IG1hcmdpbi10b3A6CiAgICAgIDBweCAhaW1wb3J0YW50OyBmb250LXNpemU6IDEuMjVl
bTsgZm9udC13ZWlnaHQ6IDYwMDsgbGluZS1oZWlnaHQ6CiAgICAgIDEuMjU7IGNvbG9yOiBy
Z2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLAogICAgICBCbGlu
a01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFs
LAogICAgICBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1
b3Q7U2Vnb2UgVUkKICAgICAgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIFN5bWJvbCZx
dW90OzsgZm9udC1zdHlsZTogbm9ybWFsOwogICAgICBmb250LXZhcmlhbnQtbGlnYXR1cmVz
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7CiAgICAgIGxldHRlci1zcGFj
aW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OwogICAgICB0ZXh0
LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1h
bDsKICAgICAgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUs
IDI1NSk7IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNv
cmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+RGVzY3JpcHRpb246PC9oMz4KICAgIDxwIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBtYXJnaW4tYm90dG9tOiAxNnB4OyBtYXJnaW4t
dG9wOgogICAgICAwcHg7IGNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAt
YXBwbGUtc3lzdGVtLAogICAgICBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJ
JnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLAogICAgICBzYW5zLXNlcmlmLCAmcXVvdDtBcHBs
ZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkKICAgICAgRW1vamkmcXVvdDss
ICZxdW90O1NlZ29lIFVJIFN5bWJvbCZxdW90OzsgZm9udC1zaXplOiAxNHB4OwogICAgICBm
b250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsKICAg
ICAgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVy
LXNwYWNpbmc6CiAgICAgIG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7
IHRleHQtaW5kZW50OiAwcHg7CiAgICAgIHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1z
cGFjZTogbm9ybWFsOyB3aWRvd3M6IDI7CiAgICAgIHdvcmQtc3BhY2luZzogMHB4OyAtd2Vi
a2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7CiAgICAgIGJhY2tncm91bmQtY29sb3I6IHJn
YigyNTUsIDI1NSwgMjU1KTsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOgogICAgICBpbml0aWFs
OyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7Ij5mc19maWxsIGZhaWxzIG9uIEJ0
cmZzCiAgICAgIHdoZW4gL2Rldi9sb29wLzxzcGFuPiA8L3NwYW4+PGVtIHN0eWxlPSJib3gt
c2l6aW5nOiBib3JkZXItYm94OyI+PHN0cm9uZwogICAgICAgICAgc3R5bGU9ImJveC1zaXpp
bmc6IGJvcmRlci1ib3g7IGZvbnQtd2VpZ2h0OiA2MDA7Ij5zaXplID0gNTEyTTwvc3Ryb25n
PjwvZW0+LjxicgogICAgICAgIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+CiAg
ICAgIEkgdGVzdGVkIG90aGVyIHNpemUsIDI1Nk0gMUcsIGFsbCBwYXNzZWQuPC9wPgogICAg
PGgzIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBtYXJnaW4tYm90dG9tOiAxNnB4
OyBtYXJnaW4tdG9wOgogICAgICAyNHB4OyBmb250LXNpemU6IDEuMjVlbTsgZm9udC13ZWln
aHQ6IDYwMDsgbGluZS1oZWlnaHQ6IDEuMjU7CiAgICAgIGNvbG9yOiByZ2IoMzYsIDQxLCA0
Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLAogICAgICBCbGlua01hY1N5c3RlbUZv
bnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLAogICAgICBzYW5z
LXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkK
ICAgICAgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIFN5bWJvbCZxdW90OzsgZm9udC1z
dHlsZTogbm9ybWFsOwogICAgICBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZv
bnQtdmFyaWFudC1jYXBzOiBub3JtYWw7CiAgICAgIGxldHRlci1zcGFjaW5nOiBub3JtYWw7
IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OwogICAgICB0ZXh0LWluZGVudDogMHB4
OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsKICAgICAgd2lk
b3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDog
MHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQt
ZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9y
OiBpbml0aWFsOyI+S2VybmVsOjwvaDM+CiAgICA8cCBzdHlsZT0iYm94LXNpemluZzogYm9y
ZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsgbWFyZ2luLXRvcDoKICAgICAgMHB4OyBj
b2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwKICAg
ICAgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNh
LCBBcmlhbCwKICAgICAgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVv
dDssICZxdW90O1NlZ29lIFVJCiAgICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBT
eW1ib2wmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsKICAgICAgZm9udC1zdHlsZTogbm9ybWFs
OyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7CiAgICAgIGZvbnQtdmFyaWFudC1j
YXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOgogICAgICBu
b3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4
OwogICAgICB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lk
b3dzOiAyOwogICAgICB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13
aWR0aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7
IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9u
LWNvbG9yOiBpbml0aWFsOyI+djUuMi1yYzEsIHFlbXV4ODYtNjQ8L3A+CiAgICA8cHJlIHN0
eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LWZhbWlseTogU0ZNb25vLVJlZ3Vs
YXIsIENvbnNvbGFzLCAmcXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssIE1lbmxvLCBDb3Vy
aWVyLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMTEuOXB4OyBtYXJnaW4tYm90dG9tOiAxNnB4
OyBtYXJnaW4tdG9wOiAwcHg7IG92ZXJmbG93LXdyYXA6IG5vcm1hbDsgYmFja2dyb3VuZC1j
b2xvcjogcmdiKDI0NiwgMjQ4LCAyNTApOyBib3JkZXItcmFkaXVzOiAzcHg7IGxpbmUtaGVp
Z2h0OiAxLjQ1OyBvdmVyZmxvdzogYXV0bzsgcGFkZGluZzogMTZweDsgY29sb3I6IHJnYigz
NiwgNDEsIDQ2KTsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVz
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7
IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0
OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lkb3dzOiAyOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0
LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5p
dGlhbDsiPjxjb2RlIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LWZhbWls
eTogU0ZNb25vLVJlZ3VsYXIsIENvbnNvbGFzLCAmcXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVv
dDssIE1lbmxvLCBDb3VyaWVyLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMTEuOXB4OyBiYWNr
Z3JvdW5kOiB0cmFuc3BhcmVudDsgYm9yZGVyLXJhZGl1czogM3B4OyBtYXJnaW46IDBweDsg
cGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgd2hpdGUtc3BhY2U6IHByZTsgd29yZC1icmVh
azogbm9ybWFsOyBkaXNwbGF5OiBpbmxpbmU7IGxpbmUtaGVpZ2h0OiBpbmhlcml0OyBvdmVy
ZmxvdzogdmlzaWJsZTsgb3ZlcmZsb3ctd3JhcDogbm9ybWFsOyI+IyBtYWtlIC1qNDAgQVJD
SD14ODZfNjQgQ1JPU1NfQ09NUElMRT14ODYtNjQtZ2NjCnVzZSBxZW11IHRvIGJvb3R1cCBr
ZXJuZWwKPC9jb2RlPjwvcHJlPgogICAgPGgzIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXIt
Ym94OyBtYXJnaW4tYm90dG9tOiAxNnB4OyBtYXJnaW4tdG9wOgogICAgICAyNHB4OyBmb250
LXNpemU6IDEuMjVlbTsgZm9udC13ZWlnaHQ6IDYwMDsgbGluZS1oZWlnaHQ6IDEuMjU7CiAg
ICAgIGNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVt
LAogICAgICBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2
ZXRpY2EsIEFyaWFsLAogICAgICBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9q
aSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkKICAgICAgRW1vamkmcXVvdDssICZxdW90O1NlZ29l
IFVJIFN5bWJvbCZxdW90OzsgZm9udC1zdHlsZTogbm9ybWFsOwogICAgICBmb250LXZhcmlh
bnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7CiAgICAg
IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0
OwogICAgICB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUt
c3BhY2U6IG5vcm1hbDsKICAgICAgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiBy
Z2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlh
bDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+TFRQOjwvaDM+CiAgICA8cCBz
dHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsgbWFy
Z2luLXRvcDoKICAgICAgMHB4OyBjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWls
eTogLWFwcGxlLXN5c3RlbSwKICAgICAgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdv
ZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwKICAgICAgc2Fucy1zZXJpZiwgJnF1b3Q7
QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJCiAgICAgIEVtb2ppJnF1
b3Q7LCAmcXVvdDtTZWdvZSBVSSBTeW1ib2wmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsKICAg
ICAgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7
CiAgICAgIGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxl
dHRlci1zcGFjaW5nOgogICAgICBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0
YXJ0OyB0ZXh0LWluZGVudDogMHB4OwogICAgICB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hp
dGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiAyOwogICAgICB3b3JkLXNwYWNpbmc6IDBweDsg
LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9y
OiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5p
dGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+bWFzdGVyIGJyYW5jaDog
ZGF0ZQogICAgICAyMDE5MDYyNTwvcD4KICAgIDxoMyBzdHlsZT0iYm94LXNpemluZzogYm9y
ZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsgbWFyZ2luLXRvcDoKICAgICAgMjRweDsg
Zm9udC1zaXplOiAxLjI1ZW07IGZvbnQtd2VpZ2h0OiA2MDA7IGxpbmUtaGVpZ2h0OiAxLjI1
OwogICAgICBjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5
c3RlbSwKICAgICAgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90Oywg
SGVsdmV0aWNhLCBBcmlhbCwKICAgICAgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3Ig
RW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJCiAgICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtT
ZWdvZSBVSSBTeW1ib2wmcXVvdDs7IGZvbnQtc3R5bGU6IG5vcm1hbDsKICAgICAgZm9udC12
YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOwog
ICAgICBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBz
dGFydDsKICAgICAgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdo
aXRlLXNwYWNlOiBub3JtYWw7CiAgICAgIHdpZG93czogMjsgd29yZC1zcGFjaW5nOiAwcHg7
IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsKICAgICAgYmFja2dyb3VuZC1jb2xv
cjogcmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6CiAgICAgIGlu
aXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDsiPlJlcHJvZHVjZTo8L2gz
PgogICAgPHByZSBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1mYW1pbHk6
IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7
LCBNZW5sbywgQ291cmllciwgbW9ub3NwYWNlOyBmb250LXNpemU6IDExLjlweDsgbWFyZ2lu
LWJvdHRvbTogMTZweDsgbWFyZ2luLXRvcDogMHB4OyBvdmVyZmxvdy13cmFwOiBub3JtYWw7
IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDYsIDI0OCwgMjUwKTsgYm9yZGVyLXJhZGl1czog
M3B4OyBsaW5lLWhlaWdodDogMS40NTsgb3ZlcmZsb3c6IGF1dG87IHBhZGRpbmc6IDE2cHg7
IGNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJp
YW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250
LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0
LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7
IHdpZG93czogMjsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lk
dGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRp
b24tY29sb3I6IGluaXRpYWw7Ij48Y29kZSBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJv
eDsgZm9udC1mYW1pbHk6IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJh
dGlvbiBNb25vJnF1b3Q7LCBNZW5sbywgQ291cmllciwgbW9ub3NwYWNlOyBmb250LXNpemU6
IDExLjlweDsgYmFja2dyb3VuZDogdHJhbnNwYXJlbnQ7IGJvcmRlci1yYWRpdXM6IDNweDsg
bWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgYm9yZGVyOiAwcHg7IHdoaXRlLXNwYWNlOiBw
cmU7IHdvcmQtYnJlYWs6IG5vcm1hbDsgZGlzcGxheTogaW5saW5lOyBsaW5lLWhlaWdodDog
aW5oZXJpdDsgb3ZlcmZsb3c6IHZpc2libGU7IG92ZXJmbG93LXdyYXA6IG5vcm1hbDsiPmJ1
aWxkIGx0cCBzb3VyY2UgYW5kIGNwIGx0cCBhbGwgb3V0cHV0cyB0byBxZW11CiMgdmkgcnVu
bHRwCmluIGZ1bmN0aW9uOiBjcmVhdGVfYmxvY2soKQogICAgZGQgaWY9L2Rldi96ZXJvIG9m
PSR7VE1QfS90ZXN0LmltZyBicz0xMDI0IGNvdW50PTI2MjE0NCAKICAgIC0tLSZndDsKICAg
IGRkIGlmPS9kZXYvemVybyBvZj0ke1RNUH0vdGVzdC5pbWcgYnM9MTAyNCBjb3VudD01MjQy
ODgKICAgIAojIHJ1bmx0cCAtZiBmcyAtcyBmc19maWxsCjwvY29kZT48L3ByZT4KICAgIDxo
MyBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsg
bWFyZ2luLXRvcDoKICAgICAgMjRweDsgZm9udC1zaXplOiAxLjI1ZW07IGZvbnQtd2VpZ2h0
OiA2MDA7IGxpbmUtaGVpZ2h0OiAxLjI1OwogICAgICBjb2xvcjogcmdiKDM2LCA0MSwgNDYp
OyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwKICAgICAgQmxpbmtNYWNTeXN0ZW1Gb250
LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwKICAgICAgc2Fucy1z
ZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJCiAg
ICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBTeW1ib2wmcXVvdDs7IGZvbnQtc3R5
bGU6IG5vcm1hbDsKICAgICAgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsOwogICAgICBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBv
cnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBzdGFydDsKICAgICAgdGV4dC1pbmRlbnQ6IDBweDsg
dGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7CiAgICAgIHdpZG93
czogMjsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsKICAgICAgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRl
Y29yYXRpb24tc3R5bGU6CiAgICAgIGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjog
aW5pdGlhbDsiPklzc3VlOjwvaDM+CiAgICA8cCBzdHlsZT0iYm94LXNpemluZzogYm9yZGVy
LWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsgbWFyZ2luLXRvcDoKICAgICAgMHB4OyBjb2xv
cjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwKICAgICAg
QmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBB
cmlhbCwKICAgICAgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDss
ICZxdW90O1NlZ29lIFVJCiAgICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBTeW1i
b2wmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsKICAgICAgZm9udC1zdHlsZTogbm9ybWFsOyBm
b250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7CiAgICAgIGZvbnQtdmFyaWFudC1jYXBz
OiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOgogICAgICBub3Jt
YWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4Owog
ICAgICB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dz
OiAyOwogICAgICB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0
aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRl
eHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNv
bG9yOiBpbml0aWFsOyI+VGhlIGlzc3VlIG1heWJlIG5vdAogICAgICByZXByb2R1Y2VkIGV2
ZXJ5dGltZSBidXQgZm91ciBmaWZ0aHMgY2hhbmNlLjwvcD4KICAgIDxwcmUgc3R5bGU9ImJv
eC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OiBTRk1vbm8tUmVndWxhciwgQ29u
c29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVubG8sIENvdXJpZXIsIG1v
bm9zcGFjZTsgZm9udC1zaXplOiAxMS45cHg7IG1hcmdpbi1ib3R0b206IDE2cHg7IG1hcmdp
bi10b3A6IDBweDsgb3ZlcmZsb3ctd3JhcDogbm9ybWFsOyBiYWNrZ3JvdW5kLWNvbG9yOiBy
Z2IoMjQ2LCAyNDgsIDI1MCk7IGJvcmRlci1yYWRpdXM6IDNweDsgbGluZS1oZWlnaHQ6IDEu
NDU7IG92ZXJmbG93OiBhdXRvOyBwYWRkaW5nOiAxNnB4OyBjb2xvcjogcmdiKDM2LCA0MSwg
NDYpOyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1h
bDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVy
LXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aWRvd3M6IDI7IHdvcmQtc3Bh
Y2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3Jh
dGlvbi1zdHlsZTogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+
PGNvZGUgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OiBTRk1v
bm8tUmVndWxhciwgQ29uc29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVu
bG8sIENvdXJpZXIsIG1vbm9zcGFjZTsgZm9udC1zaXplOiAxMS45cHg7IGJhY2tncm91bmQ6
IHRyYW5zcGFyZW50OyBib3JkZXItcmFkaXVzOiAzcHg7IG1hcmdpbjogMHB4OyBwYWRkaW5n
OiAwcHg7IGJvcmRlcjogMHB4OyB3aGl0ZS1zcGFjZTogcHJlOyB3b3JkLWJyZWFrOiBub3Jt
YWw7IGRpc3BsYXk6IGlubGluZTsgbGluZS1oZWlnaHQ6IGluaGVyaXQ7IG92ZXJmbG93OiB2
aXNpYmxlOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7Ij5zYWZlX21hY3Jvcy5jOjM1ODogQlJP
SzogZnNfZmlsbC5jOjY3OiB1bmxpbmsobW50cG9pbnQvdGhyZWFkOS9maWxlMCkgZmFpbGVk
OiBFTk9TUEMKc2FmZV9tYWNyb3MuYzozNTg6IEJST0s6IGZzX2ZpbGwuYzo2NzogdW5saW5r
KG1udHBvaW50L3RocmVhZDQvZmlsZTApIGZhaWxlZDogRU5PU1BDClsgIDE1NC43NjI1MDJd
IEJUUkZTIHdhcm5pbmcgKGRldmljZSBsb29wMCk6IGNvdWxkIG5vdCBhbGxvY2F0ZSBzcGFj
ZSBmb3IgYSBkZWxldGU7IHdpbGwgdHJ1bmNhdGUgb24gbW91bnQKWyAgMTU1LjY5MTU3N10g
QlRSRlMgd2FybmluZyAoZGV2aWNlIGxvb3AwKTogY291bGQgbm90IGFsbG9jYXRlIHNwYWNl
IGZvciBhIGRlbGV0ZTsgd2lsbCB0cnVuY2F0ZSBvbiBtb3VudApbICAxNTYuMDE3Njk3XSBC
VFJGUyB3YXJuaW5nIChkZXZpY2UgbG9vcDApOiBjb3VsZCBub3QgYWxsb2NhdGUgc3BhY2Ug
Zm9yIGEgZGVsZXRlOyB3aWxsIHRydW5jYXRlIG9uIG1vdW50CjwvY29kZT48L3ByZT4KICAg
IDxoMyBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZw
eDsgbWFyZ2luLXRvcDoKICAgICAgMjRweDsgZm9udC1zaXplOiAxLjI1ZW07IGZvbnQtd2Vp
Z2h0OiA2MDA7IGxpbmUtaGVpZ2h0OiAxLjI1OwogICAgICBjb2xvcjogcmdiKDM2LCA0MSwg
NDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwKICAgICAgQmxpbmtNYWNTeXN0ZW1G
b250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwKICAgICAgc2Fu
cy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJ
CiAgICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBTeW1ib2wmcXVvdDs7IGZvbnQt
c3R5bGU6IG5vcm1hbDsKICAgICAgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsOwogICAgICBsZXR0ZXItc3BhY2luZzogbm9ybWFs
OyBvcnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBzdGFydDsKICAgICAgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7CiAgICAgIHdp
ZG93czogMjsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDsKICAgICAgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0
LWRlY29yYXRpb24tc3R5bGU6CiAgICAgIGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xv
cjogaW5pdGlhbDsiPkFuYWx5c2lzOjwvaDM+CiAgICA8cCBzdHlsZT0iYm94LXNpemluZzog
Ym9yZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogMTZweDsgbWFyZ2luLXRvcDoKICAgICAgMHB4
OyBjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwK
ICAgICAgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0
aWNhLCBBcmlhbCwKICAgICAgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkm
cXVvdDssICZxdW90O1NlZ29lIFVJCiAgICAgIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBV
SSBTeW1ib2wmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsKICAgICAgZm9udC1zdHlsZTogbm9y
bWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7CiAgICAgIGZvbnQtdmFyaWFu
dC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOgogICAg
ICBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDog
MHB4OwogICAgICB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsg
d2lkb3dzOiAyOwogICAgICB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9r
ZS13aWR0aDogMHB4OwogICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1
NSk7IHRleHQtZGVjb3JhdGlvbi1zdHlsZToKICAgICAgaW5pdGlhbDsgdGV4dC1kZWNvcmF0
aW9uLWNvbG9yOiBpbml0aWFsOyI+T25lIG5ldyBrZXJuZWwgY29tbWl0CiAgICAgIGNvbnRh
aW5lZCBpbiB2NS4yLXJjMSBpbnRyb2R1Y2VzIHRoZSBpc3N1ZS48L3A+CiAgICA8cHJlIHN0
eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LWZhbWlseTogU0ZNb25vLVJlZ3Vs
YXIsIENvbnNvbGFzLCAmcXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssIE1lbmxvLCBDb3Vy
aWVyLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMTEuOXB4OyBtYXJnaW4tYm90dG9tOiAwcHgg
IWltcG9ydGFudDsgbWFyZ2luLXRvcDogMHB4OyBvdmVyZmxvdy13cmFwOiBub3JtYWw7IGJh
Y2tncm91bmQtY29sb3I6IHJnYigyNDYsIDI0OCwgMjUwKTsgYm9yZGVyLXJhZGl1czogM3B4
OyBsaW5lLWhlaWdodDogMS40NTsgb3ZlcmZsb3c6IGF1dG87IHBhZGRpbmc6IDE2cHg7IGNv
bG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50
LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdl
aWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFs
aWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdp
ZG93czogMjsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24t
Y29sb3I6IGluaXRpYWw7Ij48Y29kZSBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsg
Zm9udC1zaXplOiAxMS45cHg7IGJhY2tncm91bmQ6IHRyYW5zcGFyZW50IG5vbmUgcmVwZWF0
IHNjcm9sbCAwJSAwJTsgYm9yZGVyLXJhZGl1czogM3B4OyBtYXJnaW46IDBweDsgcGFkZGlu
ZzogMHB4OyBib3JkZXI6IDBweCBub25lOyB3aGl0ZS1zcGFjZTogcHJlOyB3b3JkLWJyZWFr
OiBub3JtYWw7IGRpc3BsYXk6IGlubGluZTsgbGluZS1oZWlnaHQ6IGluaGVyaXQ7IG92ZXJm
bG93OiB2aXNpYmxlOyBvdmVyZmxvdy13cmFwOiBub3JtYWw7IGZvbnQtZmFtaWx5OiBTRk1v
bm8tUmVndWxhciwgQ29uc29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVu
bG8sIENvdXJpZXIsIG1vbm9zcGFjZTsiPmNvbW1pdCBjOGVhZWFjN2I3MzQzNDdjM2FmYmE3
MDA4YjdhZjYyZjM3YjljMTQwCkF1dGhvcjogSm9zZWYgQmFjaWsgPGEgY2xhc3M9Im1vei10
eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmpvc2VmQHRveGljcGFuZGEuY29tIj4m
bHQ7am9zZWZAdG94aWNwYW5kYS5jb20mZ3Q7PC9hPgpEYXRlOiAgIFdlZCBBcHIgMTAgMTU6
NTY6MTAgMjAxOSAtMDQwMAoKICAgIGJ0cmZzOiByZXNlcnZlIGRlbGFsbG9jIG1ldGFkYXRh
IGRpZmZlcmVudGx5CiAgICAuLi48L2NvZGU+PC9wcmU+CiAgICA8cD48YnI+CiAgICA8L3A+
CiAgICA8cD5BbnlvbmUncyByZXBseSB3aWxsIGJlIGFwcHJlY2lhdGVkLjxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDUxLAogICAgICAgIDUxLCA1MSk7IGZvbnQtZmFtaWx5OiBhcmlhbDsg
Zm9udC1zaXplOiAxM3B4OyBmb250LXN0eWxlOgogICAgICAgIG5vcm1hbDsgZm9udC12YXJp
YW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2FwczoKICAgICAgICBub3Jt
YWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6
IDI7CiAgICAgICAgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQt
dHJhbnNmb3JtOiBub25lOwogICAgICAgIHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czog
Mjsgd29yZC1zcGFjaW5nOiAwcHg7CiAgICAgICAgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0
aDogMHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsCiAgICAgICAgMjU1KTsg
dGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6
CiAgICAgICAgaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBu
b25lOyI+PC9zcGFuPjwvcD4KICAgIDxwPi0tSG9uZ3poaTxicj4KICAgIDwvcD4KICAgIDxj
b2RlIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LWZhbWlseTogU0ZNb25v
LVJlZ3VsYXIsIENvbnNvbGFzLCAmcXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssIE1lbmxv
LCBDb3VyaWVyLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMTEuOXB4OyBiYWNrZ3JvdW5kOiB0
cmFuc3BhcmVudDsgYm9yZGVyLXJhZGl1czogM3B4OyBtYXJnaW46IDBweDsgcGFkZGluZzog
MHB4OyBib3JkZXI6IDBweDsgd2hpdGUtc3BhY2U6IHByZTsgd29yZC1icmVhazogbm9ybWFs
OyBkaXNwbGF5OiBpbmxpbmU7IGxpbmUtaGVpZ2h0OiBpbmhlcml0OyBvdmVyZmxvdzogdmlz
aWJsZTsgb3ZlcmZsb3ctd3JhcDogbm9ybWFsOyI+PC9jb2RlPgogIDwvYm9keT4KPC9odG1s
Pgo=
--------------4AEBAEFECEFBF27C54CD801D--

--===============0583112765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0583112765==--
