Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C50305F63
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 16:21:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64CE53C7A4F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 16:21:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E6DC53C02FA
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 02:57:37 +0100 (CET)
Received: from qq.com (out203-205-251-27.mail.qq.com [203.205.251.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 49412600B88
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 02:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1610503047; bh=6LHmrFB/NDopZ1de7iSMQhZnY9ovYC/DR/ftKti/JJ4=;
 h=To:From:Subject:Date;
 b=BO1j+qHb73jbiBOlREsR8oT4xDZv652ZUovLpj+qdHqUop3Oyh6NT3+I0R3o7SXSL
 qlNXhFB3AlFX+aqVN3t4mjeKI/CKxYnNr2UVNrqc0+Szn+1a+JskYAHjwFR+ISckhS
 Btn9/XiYRJMpAO/2QL00Gj+PBlu4thYCUqSI1Al0=
Received: from [172.30.60.221] ([111.207.174.2])
 by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
 id E241B419; Wed, 13 Jan 2021 09:56:36 +0800
X-QQ-mid: xmsmtpt1610502996t6yhdvpgy
Message-ID: <tencent_598F7E9919E72CB906450D0C9E09B406B905@qq.com>
X-QQ-XMAILINFO: OSHVuk7uaqqGj1NWS5D/DCD1AlLcZ4YGnf2rWdNH0HkmzqsP+xU1FiXA/3BN+w
 6TrEVYTWeymJmrmIuFXwIaGmH85dTeKHNMeenVgR3U+AjFy32xcbPpbqAJqSZ/5sfQ4zvJ/6SoVU
 2Unup6PFrA8OfNr/ESzdYWwIrDfjssbFepUqubhBWdSb8bT8HNH3RL0KQuoZA/JeMNTM/Qsm9T+i
 d7x07e9FGVDk/L5WiBgvAgre8JPqJLjqwL+U5MNQDH8Zw1IiCklh+4mRQgznnGlmk2qbl4Obes3L
 Z/y5ynzo81V7qZrLZpOKmdKv+Kt6bM9Mf0DogqWHkb3dv/40/o/eDIFyY/yEaHf0DITLZQNK1iL6
 lBp1ZAYhyZR5J4lFNitgcnrueQe+lBjMsw+SH2lCnn3oyb6wPunZvNv7l32D/DbGAkvdmWzdRUWQ
 aa6flcxZZCAd1GCLOJemXUeo6ovRJQ8LA80RsVSFi3J0uGH8GrGTIPHN0HmRObQHQQqnG5yHcXKj
 kgwXfuugnr0Dztl+Lzg4lwvJf9PFJZDQ/t69l3dPTvq8TCG26ZOgvW7E3eo4gwOcU1EJE7GPyvuF
 wZK/z4Vhk6C07LKcEp/uVRTwtco/H3qmptJIktUK2RpDMZihT4uhMbUwDz+yySfX0lEzjQkWxIz/
 dURyAWxITyxnZfbQo4MbqFAkufXaRU2/C4G7h2fxgcS+kdOWkHDjL4sbhEJOT2TDD1VDGXULblzJ
 A5ol9vh2JnFn3DjPpSCNenB6WOo4i3df3WzfUcg7N9PDolK1FqSNxQe/SDj+zlIaVT
To: ltp@lists.linux.it
From: tianyu <1406985325@qq.com>
X-OQ-MSGID: <171d2049-ad0a-6b71-96ff-bb3ec4885546@qq.com>
Date: Wed, 13 Jan 2021 09:56:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,RDNS_DYNAMIC,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 27 Jan 2021 16:21:23 +0100
Subject: [LTP] PCI test of ltp: wrong device was scanned
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
Content-Type: multipart/mixed; boundary="===============1613752716=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1613752716==
Content-Type: multipart/alternative;
 boundary="------------C1CB2B088E412D2290720484"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C1CB2B088E412D2290720484
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,all

I have some questions about PCI testing.

testcases/kernel/device-drivers/pci/tpci_user/tpci.c ->static void 
test_run(void)   ,the code scan the devices on a bus one by one,|then it 
calls pci_scan_slot() in kernel.||But A PCIe device has only 8 
functions. Isn’t it possible to scan the next device here?|

|For example, on the problematic machine: 1. When traversing to the 8.1 
device, it will scan to 9.0 by mistake, and then the kernel will turn 
9.0 into a multi-function device (the 9.0 device is a single-function 
device) 2. When traversing to the 8.2 device, call pci_rescan_bus in 
test-case 6 of the ltp test program to scan all devices on bus 0. At 
this time, when the 9.0 device is accessed, it is judged to be a 
multi-function device, and the subsequent functions are accessed. Before 
accessing the function, it will first judge the vendor id. If it is 
0xFFFF, it means that the function does not exist. However, at this 
time, it is found that the vendor id of 9.1 exists and is the same as 
9.0 (it should be 0xffff), so the kernel recognizes 9.1. Next, I 
reconfigured 9.1 and assigned its next level of bus to bus 4. In fact, 
bus 4 does not exist (the serial port log is as follows)|

[ 4218.291890][ 0] ltp_tpci: found pci_dev '0000:00:08.2', bus 0, devfn 
66 [ 4218.298560][ 0] ltp_tpci: Bus number: 0 [ 4218.302503][ 0] 
ltp_tpci: test-case 1 [ 4218.306232][ 0] ltp_tpci: enable pci device [ 
4218.310482][ 0] ltp_tpci: enabled pci device [ 4218.314919][ 0] 
ltp_tpci: test-case 2 [ 4218.318679][ 0] ltp_tpci: find bus [ 
4218.322164][ 0] ltp_tpci: success returned bus pointer [ 4218.327538][ 
0] ltp_tpci: test-case 3 [ 4218.331271][ 0] ltp_tpci: get pci device [ 
4218.335266][ 0] ltp_tpci: found pci device from device info [ 
4218.340974][ 0] ltp_tpci: test-case 4 [ 4218.344709][ 0] ltp_tpci: find 
pci class [ 4218.348740][ 0] ltp_tpci: found pci device from class 
number [ 4218.354664][ 0] ltp_tpci: test-case 5 [ 4218.358387][ 0] 
ltp_tpci: get pci subsys [ 4218.362383][ 0] ltp_tpci: found pci device 
from subsys info [ 4218.368070][ 0] ltp_tpci: test-case 6 [ 
4218.371802][ 0] ltp_tpci: scan pci bus [ 4218.375816][ 0] pci 
0000:00:09.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size) [ 
4218.384249][ 0] pci 0000:00:09.1: bridge configuration invalid ([bus 
00-00]), reconfiguring [ 4218.393594][ 0] pci 0000:00:09.1: PCI bridge 
to [bus 04] [ 4218.399043][ 0] pcieport 0000:00:09.1: Device 14:7a19, 
irq 96 [ 4218.405064][ 0] pcieport 0000:00:09.1: Signaling PME with IRQ 
133 [ 4218.411336][ 1] ltp_tpci: success scan bus [ 4218.415692][ 1] 
ltp_tpci: test-case 7 [ 4218.419500][ 1] ltp_tpci: scan pci slot
||

||

|I think although there may be problems with PCI devices, is the ltp 
test correct? |




--------------C1CB2B088E412D2290720484
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+IDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei10ZXh0LWh0bWwiIGxhbmc9IngtdW5p
Y29kZSI+CiAgICAgIDxwPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBm
b250LWZhbWlseToKICAgICAgICAgIC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9u
dCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssCiAgICAgICAgICBIZWx2ZXRpY2EsIEFyaWFsLCBz
YW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywKICAgICAgICAgICZx
dW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGZvbnQtc3R5bGU6
CiAgICAgICAgICBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9u
dC12YXJpYW50LWNhcHM6CiAgICAgICAgICBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxl
dHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7CiAgICAgICAgICB0ZXh0LWFsaWdu
OiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7CiAgICAg
ICAgICB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4
OwogICAgICAgICAgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNrZ3JvdW5k
LWNvbG9yOiByZ2IoMjU1LAogICAgICAgICAgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24t
dGhpY2tuZXNzOiBpbml0aWFsOwogICAgICAgICAgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBp
bml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6CiAgICAgICAgICBpbml0aWFsOyBkaXNw
bGF5OiBpbmxpbmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij5IaSxhbGw8L3NwYW4+PC9w
PgogICAgICA8cD48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1m
YW1pbHk6CiAgICAgICAgICAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZx
dW90O1NlZ29lIFVJJnF1b3Q7LAogICAgICAgICAgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1z
ZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssCiAgICAgICAgICAmcXVvdDtT
ZWdvZSBVSSBFbW9qaSZxdW90OzsgZm9udC1zaXplOiAxNHB4OyBmb250LXN0eWxlOgogICAg
ICAgICAgbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFy
aWFudC1jYXBzOgogICAgICAgICAgbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXIt
c3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOwogICAgICAgICAgdGV4dC1hbGlnbjogc3Rh
cnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOwogICAgICAgICAg
d2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsKICAg
ICAgICAgIC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xv
cjogcmdiKDI1NSwKICAgICAgICAgIDI1NSwgMjU1KTsgdGV4dC1kZWNvcmF0aW9uLXRoaWNr
bmVzczogaW5pdGlhbDsKICAgICAgICAgIHRleHQtZGVjb3JhdGlvbi1zdHlsZTogaW5pdGlh
bDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOgogICAgICAgICAgaW5pdGlhbDsgZGlzcGxheTog
aW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+SSBoYXZlIHNvbWUKICAgICAgICAg
IHF1ZXN0aW9ucyBhYm91dCBQQ0kgdGVzdGluZy48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9y
OiByZ2IoMzYsCiAgICAgICAgICA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3Rl
bSwgQmxpbmtNYWNTeXN0ZW1Gb250LAogICAgICAgICAgJnF1b3Q7U2Vnb2UgVUkmcXVvdDss
IEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsCiAgICAgICAgICAmcXVvdDtBcHBsZSBD
b2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7CiAgICAgICAg
ICBmb250LXNpemU6IDE0cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxp
Z2F0dXJlczoKICAgICAgICAgIG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsg
Zm9udC13ZWlnaHQ6IDQwMDsKICAgICAgICAgIGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9y
cGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OwogICAgICAgICAgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7CiAgICAgICAg
ICB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7CiAgICAgICAgICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1
NSk7CiAgICAgICAgICB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0
LWRlY29yYXRpb24tc3R5bGU6CiAgICAgICAgICBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24t
Y29sb3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZQogICAgICAgICAgIWltcG9ydGFudDsg
ZmxvYXQ6IG5vbmU7Ij48L3NwYW4+PGJyPgogICAgICA8L3A+CiAgICAgIDxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwK
ICAgICAgICBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2
ZXRpY2EsIEFyaWFsLAogICAgICAgIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVt
b2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSQogICAgICAgIEVtb2ppJnF1b3Q7OyBmb250LXNp
emU6IDE0cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsKICAgICAgICBmb250LXZhcmlhbnQtbGln
YXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7CiAgICAgICAgZm9u
dC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsKICAg
ICAgICB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7CiAgICAgICAgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiAyOyB3b3Jk
LXNwYWNpbmc6IDBweDsKICAgICAgICAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7
IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwKICAgICAgICAyNTUpOyB0ZXh0LWRl
Y29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6CiAg
ICAgICAgaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5
OiBpbmxpbmUKICAgICAgICAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPjxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDM2LCA0MSwgNDYpOwogICAgICAgICAgZm9udC1mYW1pbHk6IC1hcHBs
ZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UKICAgICAgICAgIFVJ
JnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xv
cgogICAgICAgICAgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyBm
b250LXNpemU6IDE0cHg7CiAgICAgICAgICBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFy
aWFudC1saWdhdHVyZXM6IG5vcm1hbDsKICAgICAgICAgIGZvbnQtdmFyaWFudC1jYXBzOiBu
b3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOgogICAgICAgICAgbm9y
bWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsK
ICAgICAgICAgIHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3
aWRvd3M6IDI7CiAgICAgICAgICB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0
cm9rZS13aWR0aDogMHB4OwogICAgICAgICAgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwg
MjU1LCAyNTUpOwogICAgICAgICAgdGV4dC1kZWNvcmF0aW9uLXRoaWNrbmVzczogaW5pdGlh
bDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOgogICAgICAgICAgaW5pdGlhbDsgdGV4dC1kZWNv
cmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBpbmxpbmUKICAgICAgICAgICFpbXBv
cnRhbnQ7IGZsb2F0OiBub25lOyI+dGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9w
Y2kvdHBjaV91c2VyL3RwY2kuYwogICAgICAgICAgLSZndDtzdGF0aWMgdm9pZCB0ZXN0X3J1
bih2b2lkKTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6CiAgICAgICAgICByZ2IoMzYsIDQx
LCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLAogICAgICAgICAgQmxpbmtNYWNT
eXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwKICAg
ICAgICAgIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVv
dDtTZWdvZSBVSQogICAgICAgICAgRW1vamkmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsgZm9u
dC1zdHlsZTogbm9ybWFsOwogICAgICAgICAgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9y
bWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOwogICAgICAgICAgZm9udC13ZWlnaHQ6
IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsKICAgICAgICAgIHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9u
ZTsKICAgICAgICAgIHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogMjsgd29yZC1zcGFj
aW5nOiAwcHg7CiAgICAgICAgICAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGJh
Y2tncm91bmQtY29sb3I6IHJnYigyNTUsCiAgICAgICAgICAyNTUsIDI1NSk7IHRleHQtZGVj
b3JhdGlvbi10aGlja25lc3M6IGluaXRpYWw7CiAgICAgICAgICB0ZXh0LWRlY29yYXRpb24t
c3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjoKICAgICAgICAgIGluaXRp
YWw7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPsKgwqAgLHRo
ZQogICAgICAgICAgY29kZSBzY2FuIHRoZSBkZXZpY2VzIG9uIGEgYnVzIG9uZSBieSBvbmUs
PC9zcGFuPjwvc3Bhbj48Y29kZSBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9u
dC1mYW1pbHk6IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBN
b25vJnF1b3Q7LCBNZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDEycHg7IHBhZGRpbmc6
IDBweDsgbWFyZ2luOiAwcHg7IGJhY2tncm91bmQ6IGluaXRpYWw7IGJvcmRlci1yYWRpdXM6
IDZweDsgd29yZC1icmVhazogbm9ybWFsOyB3aGl0ZS1zcGFjZTogcHJlOyBib3JkZXI6IDBw
eDsgZGlzcGxheTogaW5saW5lOyBvdmVyZmxvdzogdmlzaWJsZTsgbGluZS1oZWlnaHQ6IGlu
aGVyaXQ7IG92ZXJmbG93LXdyYXA6IG5vcm1hbDsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdi
KDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0
ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1z
ZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVt
b2ppJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12
YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBm
b250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0
ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5v
bmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogMjsgd29yZC1zcGFjaW5nOiAwcHg7
IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xvcjogcmdi
KDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0aWFsOyB0
ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1jb2xvcjog
aW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25lOyI+dGhl
biBpdCBjYWxscyBwY2lfc2Nhbl9zbG90KCkgaW4ga2VybmVsLjwvc3Bhbj48L2NvZGU+PGNv
ZGUgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OiBTRk1vbm8t
UmVndWxhciwgQ29uc29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVubG8s
IG1vbm9zcGFjZTsgZm9udC1zaXplOiAxMnB4OyBwYWRkaW5nOiAwcHg7IG1hcmdpbjogMHB4
OyBiYWNrZ3JvdW5kOiBpbml0aWFsOyBib3JkZXItcmFkaXVzOiA2cHg7IHdvcmQtYnJlYWs6
IG5vcm1hbDsgd2hpdGUtc3BhY2U6IHByZTsgYm9yZGVyOiAwcHg7IGRpc3BsYXk6IGlubGlu
ZTsgb3ZlcmZsb3c6IHZpc2libGU7IGxpbmUtaGVpZ2h0OiBpbmhlcml0OyBvdmVyZmxvdy13
cmFwOiBub3JtYWw7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9u
dC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vn
b2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxl
IENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OzsgZm9udC1z
aXplOiAxNHB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6
IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsg
bGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7
IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTog
bm9ybWFsOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ry
b2tlLXdpZHRoOiAwcHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsg
dGV4dC1kZWNvcmF0aW9uLXRoaWNrbmVzczogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLXN0
eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7IGRpc3BsYXk6
IGlubGluZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPkJ1dCBBIFBDSWUgZGV2aWNlIGhh
cyBvbmx5IDggZnVuY3Rpb25zLiBJc27igJl0IGl0IHBvc3NpYmxlIHRvIHNjYW4gdGhlIG5l
eHQgZGV2aWNlIGhlcmU/PC9zcGFuPjwvY29kZT4KICAgICAgPHA+PGNvZGUgc3R5bGU9ImJv
eC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OiBTRk1vbm8tUmVndWxhciwgQ29u
c29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVubG8sIG1vbm9zcGFjZTsg
Zm9udC1zaXplOiAxMnB4OyBwYWRkaW5nOiAwcHg7IG1hcmdpbjogMHB4OyBiYWNrZ3JvdW5k
OiBpbml0aWFsOyBib3JkZXItcmFkaXVzOiA2cHg7IHdvcmQtYnJlYWs6IG5vcm1hbDsgd2hp
dGUtc3BhY2U6IHByZTsgYm9yZGVyOiAwcHg7IGRpc3BsYXk6IGlubGluZTsgb3ZlcmZsb3c6
IHZpc2libGU7IGxpbmUtaGVpZ2h0OiBpbmhlcml0OyBvdmVyZmxvdy13cmFwOiBub3JtYWw7
Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6IC1h
cHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDss
IEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2pp
JnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OzsgZm9udC1zaXplOiAxNHB4OyBm
b250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9u
dC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNp
bmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50
OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRv
d3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAw
cHg7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgdGV4dC1kZWNvcmF0
aW9uLXRoaWNrbmVzczogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFs
OyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZSAhaW1w
b3J0YW50OyBmbG9hdDogbm9uZTsiPkZvciBleGFtcGxlLCBvbiB0aGUgcHJvYmxlbWF0aWMg
bWFjaGluZToKMS4gV2hlbiB0cmF2ZXJzaW5nIHRvIHRoZSA4LjEgZGV2aWNlLCBpdCB3aWxs
IHNjYW4gdG8gOS4wIGJ5IG1pc3Rha2UsIGFuZCB0aGVuIHRoZSBrZXJuZWwgd2lsbCB0dXJu
IDkuMCBpbnRvIGEgbXVsdGktZnVuY3Rpb24gZGV2aWNlICh0aGUgOS4wIGRldmljZSBpcyBh
IHNpbmdsZS1mdW5jdGlvbiBkZXZpY2UpCjIuIFdoZW4gdHJhdmVyc2luZyB0byB0aGUgOC4y
IGRldmljZSwgY2FsbCBwY2lfcmVzY2FuX2J1cyBpbiB0ZXN0LWNhc2UgNiBvZiB0aGUgbHRw
IHRlc3QgcHJvZ3JhbSB0byBzY2FuIGFsbCBkZXZpY2VzIG9uIGJ1cyAwLiBBdCB0aGlzIHRp
bWUsIHdoZW4gdGhlIDkuMCBkZXZpY2UgaXMgYWNjZXNzZWQsIGl0IGlzIGp1ZGdlZCB0byBi
ZSBhIG11bHRpLWZ1bmN0aW9uIGRldmljZSwgYW5kIHRoZSBzdWJzZXF1ZW50IGZ1bmN0aW9u
cyBhcmUgYWNjZXNzZWQuIEJlZm9yZSBhY2Nlc3NpbmcgdGhlIGZ1bmN0aW9uLCBpdCB3aWxs
IGZpcnN0IGp1ZGdlIHRoZSB2ZW5kb3IgaWQuIElmIGl0IGlzIDB4RkZGRiwgaXQgbWVhbnMg
dGhhdCB0aGUgZnVuY3Rpb24gZG9lcyBub3QgZXhpc3QuIEhvd2V2ZXIsIGF0IHRoaXMgdGlt
ZSwgaXQgaXMgZm91bmQgdGhhdCB0aGUgdmVuZG9yIGlkIG9mIDkuMSBleGlzdHMgYW5kIGlz
IHRoZSBzYW1lIGFzIDkuMCAoaXQgc2hvdWxkIGJlIDB4ZmZmZiksIHNvIHRoZSBrZXJuZWwg
cmVjb2duaXplcyA5LjEuIE5leHQsIEkgcmVjb25maWd1cmVkIDkuMSBhbmQgYXNzaWduZWQg
aXRzIG5leHQgbGV2ZWwgb2YgYnVzIHRvIGJ1cyA0LiBJbiBmYWN0LCBidXMgNCBkb2VzIG5v
dCBleGlzdCAodGhlIHNlcmlhbCBwb3J0IGxvZyBpcyBhcyBmb2xsb3dzKTwvc3Bhbj48L2Nv
ZGU+PC9wPgogICAgICA8cD48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzMywgMzMsIDMzKTsg
Zm9udC1mYW1pbHk6ICZxdW90O1JvYm90byBNb25vJnF1b3Q7LCAmcXVvdDtTRiBNb25vJnF1
b3Q7LCAmcXVvdDtMdWNpZGEgQ29uc29sZSZxdW90OywgTW9uYWNvLCBtb25vc3BhY2U7IGZv
bnQtc2l6ZTogMTMuMDA2cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxp
Z2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdo
dDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFsaWdu
OiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRl
LXNwYWNlOiBwcmUtd3JhcDsgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtp
dC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBp
bml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlv
bi1jb2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBu
b25lOyI+WyA0MjE4LjI5MTg5MF1bICAwXSBsdHBfdHBjaTogZm91bmQgcGNpX2RldiAnMDAw
MDowMDowOC4yJywgYnVzIDAsIGRldmZuIDY2ClsgNDIxOC4yOTg1NjBdWyAgMF0gbHRwX3Rw
Y2k6IEJ1cyBudW1iZXI6IDAKWyA0MjE4LjMwMjUwM11bICAwXSBsdHBfdHBjaTogdGVzdC1j
YXNlIDEKWyA0MjE4LjMwNjIzMl1bICAwXSBsdHBfdHBjaTogZW5hYmxlIHBjaSBkZXZpY2UK
WyA0MjE4LjMxMDQ4Ml1bICAwXSBsdHBfdHBjaTogZW5hYmxlZCBwY2kgZGV2aWNlClsgNDIx
OC4zMTQ5MTldWyAgMF0gbHRwX3RwY2k6IHRlc3QtY2FzZSAyClsgNDIxOC4zMTg2NzldWyAg
MF0gbHRwX3RwY2k6IGZpbmQgYnVzClsgNDIxOC4zMjIxNjRdWyAgMF0gbHRwX3RwY2k6IHN1
Y2Nlc3MgcmV0dXJuZWQgYnVzIHBvaW50ZXIKWyA0MjE4LjMyNzUzOF1bICAwXSBsdHBfdHBj
aTogdGVzdC1jYXNlIDMKWyA0MjE4LjMzMTI3MV1bICAwXSBsdHBfdHBjaTogZ2V0IHBjaSBk
ZXZpY2UKWyA0MjE4LjMzNTI2Nl1bICAwXSBsdHBfdHBjaTogZm91bmQgcGNpIGRldmljZSBm
cm9tIGRldmljZSBpbmZvClsgNDIxOC4zNDA5NzRdWyAgMF0gbHRwX3RwY2k6IHRlc3QtY2Fz
ZSA0ClsgNDIxOC4zNDQ3MDldWyAgMF0gbHRwX3RwY2k6IGZpbmQgcGNpIGNsYXNzClsgNDIx
OC4zNDg3NDBdWyAgMF0gbHRwX3RwY2k6IGZvdW5kIHBjaSBkZXZpY2UgZnJvbSBjbGFzcyBu
dW1iZXIKWyA0MjE4LjM1NDY2NF1bICAwXSBsdHBfdHBjaTogdGVzdC1jYXNlIDUKWyA0MjE4
LjM1ODM4N11bICAwXSBsdHBfdHBjaTogZ2V0IHBjaSBzdWJzeXMKWyA0MjE4LjM2MjM4M11b
ICAwXSBsdHBfdHBjaTogZm91bmQgcGNpIGRldmljZSBmcm9tIHN1YnN5cyBpbmZvClsgNDIx
OC4zNjgwNzBdWyAgMF0gbHRwX3RwY2k6IHRlc3QtY2FzZSA2ClsgNDIxOC4zNzE4MDJdWyAg
MF0gbHRwX3RwY2k6IHNjYW4gcGNpIGJ1cwpbIDQyMTguMzc1ODE2XVsgIDBdIHBjaSAwMDAw
OjAwOjA5LjE6IFtGaXJtd2FyZSBCdWddOiByZWcgMHgxMDogaW52YWxpZCBCQVIgKGNhbid0
IHNpemUpClsgNDIxOC4zODQyNDldWyAgMF0gcGNpIDAwMDA6MDA6MDkuMTogYnJpZGdlIGNv
bmZpZ3VyYXRpb24gaW52YWxpZCAoW2J1cyAwMC0wMF0pLCByZWNvbmZpZ3VyaW5nClsgNDIx
OC4zOTM1OTRdWyAgMF0gcGNpIDAwMDA6MDA6MDkuMTogUENJIGJyaWRnZSB0byBbYnVzIDA0
XQpbIDQyMTguMzk5MDQzXVsgIDBdIHBjaWVwb3J0IDAwMDA6MDA6MDkuMTogRGV2aWNlIDE0
OjdhMTksIGlycSA5NgpbIDQyMTguNDA1MDY0XVsgIDBdIHBjaWVwb3J0IDAwMDA6MDA6MDku
MTogU2lnbmFsaW5nIFBNRSB3aXRoIElSUSAxMzMKWyA0MjE4LjQxMTMzNl1bICAxXSBsdHBf
dHBjaTogc3VjY2VzcyBzY2FuIGJ1cwpbIDQyMTguNDE1NjkyXVsgIDFdIGx0cF90cGNpOiB0
ZXN0LWNhc2UgNwpbIDQyMTguNDE5NTAwXVsgIDFdIGx0cF90cGNpOiBzY2FuIHBjaSBzbG90
PC9zcGFuPjxicj4KICAgICAgICA8Y29kZSBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJv
eDsgZm9udC1mYW1pbHk6IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJh
dGlvbiBNb25vJnF1b3Q7LCBNZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDEycHg7IHBh
ZGRpbmc6IDBweDsgbWFyZ2luOiAwcHg7IGJhY2tncm91bmQ6IGluaXRpYWw7IGJvcmRlci1y
YWRpdXM6IDZweDsgd29yZC1icmVhazogbm9ybWFsOyB3aGl0ZS1zcGFjZTogcHJlOyBib3Jk
ZXI6IDBweDsgZGlzcGxheTogaW5saW5lOyBvdmVyZmxvdzogdmlzaWJsZTsgbGluZS1oZWln
aHQ6IGluaGVyaXQ7IG92ZXJmbG93LXdyYXA6IG5vcm1hbDsiPjxzcGFuIHN0eWxlPSJjb2xv
cjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtN
YWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwg
c2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29l
IFVJIEVtb2ppJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsg
Zm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9y
bWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5z
OiAyOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdpZG93czogMjsgd29yZC1zcGFjaW5n
OiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dyb3VuZC1jb2xv
cjogcmdiKDI1NSwgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tuZXNzOiBpbml0
aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1j
b2xvcjogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IGZsb2F0OiBub25l
OyI+PC9zcGFuPjwvY29kZT48L3A+CiAgICAgIDxwPjxjb2RlIHN0eWxlPSJib3gtc2l6aW5n
OiBib3JkZXItYm94OyBmb250LWZhbWlseTogU0ZNb25vLVJlZ3VsYXIsIENvbnNvbGFzLCAm
cXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssIE1lbmxvLCBtb25vc3BhY2U7IGZvbnQtc2l6
ZTogMTJweDsgcGFkZGluZzogMHB4OyBtYXJnaW46IDBweDsgYmFja2dyb3VuZDogaW5pdGlh
bDsgYm9yZGVyLXJhZGl1czogNnB4OyB3b3JkLWJyZWFrOiBub3JtYWw7IHdoaXRlLXNwYWNl
OiBwcmU7IGJvcmRlcjogMHB4OyBkaXNwbGF5OiBpbmxpbmU7IG92ZXJmbG93OiB2aXNpYmxl
OyBsaW5lLWhlaWdodDogaW5oZXJpdDsgb3ZlcmZsb3ctd3JhcDogbm9ybWFsOyI+PHNwYW4g
c3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lz
dGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRp
Y2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90Oywg
JnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7IGZvbnQtc2l6ZTogMTRweDsgZm9udC1zdHls
ZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IGZvbnQtdmFyaWFu
dC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1zcGFjaW5nOiBub3Jt
YWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0
ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiAyOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNr
Z3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVjb3JhdGlvbi10aGlj
a25lc3M6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1zdHlsZTogaW5pdGlhbDsgdGV4dC1k
ZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsg
ZmxvYXQ6IG5vbmU7Ij4KPC9zcGFuPjwvY29kZT48L3A+CiAgICAgIDxwPjxjb2RlIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LWZhbWlseTogU0ZNb25vLVJlZ3VsYXIs
IENvbnNvbGFzLCAmcXVvdDtMaWJlcmF0aW9uIE1vbm8mcXVvdDssIE1lbmxvLCBtb25vc3Bh
Y2U7IGZvbnQtc2l6ZTogMTJweDsgcGFkZGluZzogMHB4OyBtYXJnaW46IDBweDsgYmFja2dy
b3VuZDogaW5pdGlhbDsgYm9yZGVyLXJhZGl1czogNnB4OyB3b3JkLWJyZWFrOiBub3JtYWw7
IHdoaXRlLXNwYWNlOiBwcmU7IGJvcmRlcjogMHB4OyBkaXNwbGF5OiBpbmxpbmU7IG92ZXJm
bG93OiB2aXNpYmxlOyBsaW5lLWhlaWdodDogaW5oZXJpdDsgb3ZlcmZsb3ctd3JhcDogbm9y
bWFsOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5
OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1
b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBF
bW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7IGZvbnQtc2l6ZTogMTRw
eDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7
IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1z
cGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWlu
ZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsg
d2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0
aDogMHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IHRleHQtZGVj
b3JhdGlvbi10aGlja25lc3M6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1zdHlsZTogaW5p
dGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBkaXNwbGF5OiBpbmxpbmUg
IWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij5JIHRoaW5rIGFsdGhvdWdoIHRoZXJlIG1heSBi
ZSBwcm9ibGVtcyB3aXRoIFBDSSBkZXZpY2VzLCBpcyB0aGUgbHRwIHRlc3QgY29ycmVjdD8K
PC9zcGFuPjwvY29kZT48L3A+CiAgICAgIDxicj4KICAgICAgPHA+PGJyPgogICAgICA8L3A+
CiAgICAgIDxwPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZh
bWlseToKICAgICAgICAgIC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1
b3Q7U2Vnb2UgVUkmcXVvdDssCiAgICAgICAgICBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNl
cmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywKICAgICAgICAgICZxdW90O1Nl
Z29lIFVJIEVtb2ppJnF1b3Q7OyBmb250LXNpemU6IDE0cHg7IGZvbnQtc3R5bGU6CiAgICAg
ICAgICBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJp
YW50LWNhcHM6CiAgICAgICAgICBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRlci1z
cGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7CiAgICAgICAgICB0ZXh0LWFsaWduOiBzdGFy
dDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7CiAgICAgICAgICB3
aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4OwogICAg
ICAgICAgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNrZ3JvdW5kLWNvbG9y
OiByZ2IoMjU1LAogICAgICAgICAgMjU1LCAyNTUpOyB0ZXh0LWRlY29yYXRpb24tdGhpY2tu
ZXNzOiBpbml0aWFsOwogICAgICAgICAgdGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0aWFs
OyB0ZXh0LWRlY29yYXRpb24tY29sb3I6CiAgICAgICAgICBpbml0aWFsOyBkaXNwbGF5OiBp
bmxpbmUgIWltcG9ydGFudDsgZmxvYXQ6IG5vbmU7Ij48L3NwYW4+PC9wPgogICAgPC9kaXY+
CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------C1CB2B088E412D2290720484--

--===============1613752716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1613752716==--
