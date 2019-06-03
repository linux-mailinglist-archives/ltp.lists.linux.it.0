Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1E35AF1
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 13:15:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F6BE3EA6D3
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 13:15:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AC1C92D0139
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 06:43:57 +0200 (CEST)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9FC4B600675
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 06:43:56 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04391; MF=wuyihao@linux.alibaba.com; NM=1;
 PH=DS; RN=6; SR=0; TI=SMTPD_---0TTGLCVj_1559537026; 
Received: from ali-186590dcce93-2.local(mailfrom:wuyihao@linux.alibaba.com
 fp:SMTPD_---0TTGLCVj_1559537026) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 03 Jun 2019 12:43:46 +0800
From: Yihao Wu <wuyihao@linux.alibaba.com>
To: ltp@lists.linux.it, chrubis@suse.cz
Message-ID: <3e2f5f1b-3fb8-8c16-5c04-383221c175ed@linux.alibaba.com>
Date: Mon, 3 Jun 2019 12:44:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 05 Jun 2019 13:15:18 +0200
Cc: shanpeic@linux.alibaba.com,
 =?UTF-8?B?6KeJ5bCP?= <juexiao.sxh@linux.alibaba.com>, caspar@linux.alibaba.com
Subject: [LTP]  [PATCH] commands: add test for chrt
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhpcyB0ZXN0IGNoZWNrcyBjaGVjayB3aGV0aGVyIGNocnQgd29ya3MgcHJvcGVybHkKClNpZ25l
ZC1vZmYtYnk6IFlpaGFvIFd1IDx3dXlpaGFvQGxpbnV4LmFsaWJhYmEuY29tPgotLS0KIHJ1bnRl
c3QvY29tbWFuZHMgICAgICAgICAgICAgICAgICB8ICAxICsKIHRlc3RjYXNlcy9jb21tYW5kcy9j
aHJ0L01ha2VmaWxlICB8IDIxICsrKysrKysrKysrKysrKysKIHRlc3RjYXNlcy9jb21tYW5kcy9j
aHJ0L2NocnQwMS5zaCB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
dGVzdGNhc2VzL2NvbW1hbmRzL2NocnQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0
Y2FzZXMvY29tbWFuZHMvY2hydC9jaHJ0MDEuc2gKCmRpZmYgLS1naXQgYS9ydW50ZXN0L2NvbW1h
bmRzIGIvcnVudGVzdC9jb21tYW5kcwppbmRleCBhYzE1ZThiLi43NGJkODYwIDEwMDY0NAotLS0g
YS9ydW50ZXN0L2NvbW1hbmRzCisrKyBiL3J1bnRlc3QvY29tbWFuZHMKQEAgLTQwLDMgKzQwLDQg
QEAga2V5Y3RsMDFfc2gga2V5Y3RsMDEuc2gKIGdkYjAxX3NoIGdkYjAxLnNoCiB1bnNoYXJlMDFf
c2ggdW5zaGFyZTAxLnNoCiBzeXNjdGwwMV9zaCBzeXNjdGwwMS5zaAorY2hydDAxX3NoIGNocnQw
MS5zaApkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2NvbW1hbmRzL2NocnQvTWFrZWZpbGUgYi90ZXN0
Y2FzZXMvY29tbWFuZHMvY2hydC9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi5jNmY5MzFiCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdGNhc2VzL2NvbW1hbmRzL2No
cnQvTWFrZWZpbGUKQEAgLTAsMCArMSwyMSBAQAorIworIyBDb3B5cmlnaHQgKGMpIDIwMTkgQWxp
YmFiYSBJbmMKKyMgQXV0aG9yOiBZaWhhbyBXdSA8d3V5aWhhb0BsaW51eC5hbGliYWJhLmNvbT4K
KyMKKyMgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vciBtb2RpZnkKKyMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyMgKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyMKKyMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjIE1FUkNI
QU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gU2VlCisjIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorCit0b3Bfc3Jj
ZGlyCQk/PSAuLi8uLi8uLgorCitpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9lbnZf
cHJlLm1rCisKK0lOU1RBTExfVEFSR0VUUwkJOj0gY2hydDAxLnNoCisKK2luY2x1ZGUgJCh0b3Bf
c3JjZGlyKS9pbmNsdWRlL21rL2dlbmVyaWNfbGVhZl90YXJnZXQubWsKZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9jb21tYW5kcy9jaHJ0L2NocnQwMS5zaCBiL3Rlc3RjYXNlcy9jb21tYW5kcy9jaHJ0
L2NocnQwMS5zaApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwLi42MzNiM2MwCi0t
LSAvZGV2L251bGwKKysrIGIvdGVzdGNhc2VzL2NvbW1hbmRzL2NocnQvY2hydDAxLnNoCkBAIC0w
LDAgKzEsNTIgQEAKKyMhL2Jpbi9zaAorIyBDb3B5cmlnaHQgKGMpIDIwMTkgQWxpYmFiYSBJbmMK
KyMgQXV0aG9yOiBZaWhhbyBXdSA8d3V5aWhhb0BsaW51eC5hbGliYWJhLmNvbT4KKyMKKyMgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKKyMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsg
ZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyMgKGF0IHlvdXIgb3B0aW9uKSBh
bnkgbGF0ZXIgdmVyc2lvbi4KKyMKKyMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisjIE1FUkNIQU5UQUJJTElU
WSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gU2VlCisjIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIworIyBUZXN0IHRoZSBiYXNp
YyBmdW5jdGlvbmFsaXR5IG9mIGNocnQgY29tbWFuZC4KKyMKK1RTVF9URVNURlVOQz1jaHJ0X3Rl
c3QKK1RTVF9TRVRVUD1zZXR1cAorVFNUX0NMRUFOVVA9Y2xlYW51cAorVFNUX05FRURTX0NNRFM9
ImNocnQgY2dleGVjIGNnc2V0IGNnZ2V0IgorVFNUX05FRURTX1JPT1Q9MQorLiB0c3RfdGVzdC5z
aAorCitzZXR1cCgpCit7CisJb2xkX3J0X3J1bnRpbWVfdXM9JChjZ2dldCAtciBjcHUucnRfcnVu
dGltZV91cyAvIC12bikKKwlvbGRfcnRfcGVyaW9kX3VzPSQoY2dnZXQgLXIgY3B1LnJ0X3Blcmlv
ZF91cyAvIC12bikKKworCWNnc2V0IC1yIGNwdS5ydF9ydW50aW1lX3VzPTEwMDAwIC8KKwljZ3Nl
dCAtciBjcHUucnRfcGVyaW9kX3VzPTEwMDAwMDAgLworfQorCitjaHJ0X3Rlc3QoKQoreworCWNn
ZXhlYyAtZyBjcHU6LyAtZyBjcHVzZXQ6LyBzbGVlcCA0ICYKKwlQSUQ9JCEKKwljZ2V4ZWMgLWcg
Y3B1Oi8gLWcgY3B1c2V0Oi8gY2hydCAtYXJwIDUwICR7UElEfQorCVNDSEVEVUxFUj0kKGNocnQg
LXAgJHtQSUR9IHwgYXdrICdOUj09MXtwcmludCAkNn0nKQorCWlmIFsgeCIke1NDSEVEVUxFUn0i
ID09IHgiU0NIRURfUlIiIF07IHRoZW4KKwkJdHN0X3JlcyBUUEFTUyAiJ2NocnQnIHBhc3NlZC4i
CisJZWxzZQorCQl0c3RfcmVzIFRGQUlMICInY2hydCcgZmFpbGVkIHRvIHNldCBzY2hlZHVsaW5n
IHBvbGljeS4iCisJZmkKK30KKworY2xlYW51cCgpCit7CisJY2dzZXQgLXIgY3B1LnJ0X3J1bnRp
bWVfdXM9JHtvbGRfcnRfcnVudGltZV91c30gLworCWNnc2V0IC1yIGNwdS5ydF9wZXJpb2RfdXM9
JHtvbGRfcnRfcGVyaW9kX3VzfSAvCit9CisKK3RzdF9ydW4KLS0gCjEuOC4zLjEKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
