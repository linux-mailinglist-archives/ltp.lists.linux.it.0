Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E802188238
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:30:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA8863C55D9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:30:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 430783C0BA3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:30:27 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 60730200D2E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:30:26 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id b22so9486728pls.12
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=ibb13ilAvaMLAWYwx6Gmc0lrxPWySPRRHUKFdK3z0hE=;
 b=ROR+FpgkedTJbk8YKRjDBPp1vr/8ywksmfVbJD3mQc48TThl15ShrYRa/0/Jg4h5LW
 gitqaT2K3x8vEgP2qvhMtSbvBRx5l5FRO3OX/YULOUFbhLOTSWufUU8d959dCGkKcp6j
 ym8QILM0PIAkM3RrTJlUA7EVQkEhimjS+9cu5bG+aTzu1KQcIUbz27g6u8Tdj1hwj3kJ
 RivunkIG+G/pvVyLHqyGiJ2rCsRgpxHk0BcINz3tEuyonWVhAPhcQ4QHaL/mfRkCcc53
 lk679V7GKLUsk71TiG/L2ccIZC4n9Bd34nVZ5440/CIzyJdDUl0MXCN14PUJ9x/W8zM9
 9twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ibb13ilAvaMLAWYwx6Gmc0lrxPWySPRRHUKFdK3z0hE=;
 b=QhCItoaNrWL9z5ZJcUzeBn1vchwE7BpC432omOhoq2fj67CLhzfZpdZdE6SqEPKbz6
 5OLOTi7reXqFcmHueC0prddvpVMlKPZ15q1zb4qqZ7sca2EK9t8KNE0I/4AKfyPPzqqJ
 o+w3tA2GKCDuFzG+LnIWFH1qwiyERcj03QiN1O6VEMbZ/6Vdiw4KHBKD/cO6LRmFzkuJ
 mVUaLx5n0zd6A2zQmO3nex1e4tjJYg7own/p5wfhn7sQasl7C5ePx8/Jaatz/NNi1I0v
 x/E9bdV8Wlub8vKwkbzuaYffpXsvyCd0tFouYx8iiqryyQcojSJjYTKCFpVfBVLndBLF
 vJYw==
X-Gm-Message-State: ANhLgQ0K1WF2y9jRfRpzl88I+ltPjGf+xw+gKIMZXLgSUViHMl7719lt
 VAdpzQfR0KxgoxBltrk1DP4=
X-Google-Smtp-Source: ADFU+vvzjK3zl3Jyoh04LBrQUhYluHB9bRafP566jBpE/4sIyw3quH7sTD2M4fo5D9AVMNPtj8jEjw==
X-Received: by 2002:a17:902:5984:: with SMTP id
 p4mr3935684pli.43.1584444624829; 
 Tue, 17 Mar 2020 04:30:24 -0700 (PDT)
Received: from [192.168.21.6] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id i187sm2950647pfg.33.2020.03.17.04.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 04:30:24 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 17 Mar 2020 04:30:23 -0700
Message-Id: <9A4A80BA-97B7-4057-B988-E0A53EE9EC16@gmail.com>
References: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
To: Zou Wei <zou_wei@huawei.com>
X-Mailer: iPhone Mail (17D50)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Fix compilation issues
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TkFLLgoKVGhpcyBzaG91bGQgdXNlIExETElCUywgYXMgb3RoZXJzIGhhdmUgcG9pbnRlZCBvdXQs
IG5vdCBMREZMQUdTLgoKVGhpcyBhbHNvIHNwYW1zIHRoZXNlIGxpYnJhcmllcyBvbiBhbGwgdGVz
dHMsIGluc3RlYWQgb2YgdGhlIG9uZXMgdGhhdCBuZWVkIGl0LgoKSSBjYW4gc2VlIHRoZXJl4oCZ
cyBhIGRlc2lyZSB0byBidWlsZC9tYWtlIG9wZW4gcG9zaXggdGVzdHN1aXRlIGJ5IGRlZmF1bHQu
IEnigJlsbCBsb29rIGludG8gbWFraW5nIGl0IHNvIHNvb24gYmVjYXVzZSB0aGUgY3VycmVudCBt
b2RlbCBpcyBhIFBJVEEgdG8gbWFpbnRhaW4gYW5kIGRvZXNu4oCZdCBpbnRlZ3JhdGUgd2VsbCBp
bnRvIENJL0NELgoKQ2hlZXJzLAotRW5qaQoKPiBPbiBNYXIgMTcsIDIwMjAsIGF0IDAwOjIwLCBa
b3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+IHdyb3RlOgo+IAo+IO+7v0ZpeCBjb21waWxhdGlv
biBpc3N1ZXM6Cj4gMS4gQWRkIHRoZSAnLWxwdGhyZWFkIC1scnQgLWxtJyBjb25maWcgaW50byBM
REZMQUdTCj4gMi4gVXBkYXRlIG1ha2VmaWxlIGFuZCBsb2NhdGUtdGVzdCBzY3JpcHQKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4gLS0tCj4gdGVzdGNh
c2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL0xERkxBR1MgICAgICAgICAgICAgfCAxICsKPiB0ZXN0
Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvZnVuY3Rpb25hbC9NYWtlZmlsZSB8IDIgKy0KPiB0
ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9sb2NhdGUtdGVzdCB8IDIgKy0K
PiB0ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL01ha2VmaWxlICAgICB8IDIg
Ky0KPiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL0xERkxBR1MgYi90
ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvTERGTEFHUwo+IGluZGV4IGU2OWRlMjkuLjZj
MTEyZDMgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL0xERkxB
R1MKPiArKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvTERGTEFHUwo+IEBAIC0w
LDAgKzEgQEAKPiArLWxwdGhyZWFkIC1scnQgLWxtCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9v
cGVuX3Bvc2l4X3Rlc3RzdWl0ZS9mdW5jdGlvbmFsL01ha2VmaWxlIGIvdGVzdGNhc2VzL29wZW5f
cG9zaXhfdGVzdHN1aXRlL2Z1bmN0aW9uYWwvTWFrZWZpbGUKPiBpbmRleCAzYjIyYzg5Li41MGUw
M2FhIDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9mdW5jdGlv
bmFsL01ha2VmaWxlCj4gKysrIGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2Z1bmN0
aW9uYWwvTWFrZWZpbGUKPiBAQCAtNSw3ICs1LDcgQEAKPiAjCj4gCj4gYWxsIGNsZWFuIGluc3Rh
bGwgdGVzdDoKPiAtICAgIEBmb3IgZGlyIGluIGBscyAtZCAqL01ha2VmaWxlIDI+L2Rldi9udWxs
IHwgc2VkIC1lICdzLC9NYWtlZmlsZSQkLCxnJ2A7IGRvIFwKPiArICAgIEBmb3IgZGlyIGluIGBm
aW5kIC4gLW5hbWUgKk1ha2VmaWxlIHwgZWdyZXAgLXYgJ14uL01ha2VmaWxlJyB8IHNlZCAtZSAn
cywvTWFrZWZpbGUkJCwsZydgOyBkbyBcCj4gICAgICAgICQoTUFLRSkgLUMgJCRkaXIgJEA7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgIGRvbmUKPiAKPiBkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvbG9jYXRlLXRlc3QgYi90ZXN0Y2Fz
ZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9sb2NhdGUtdGVzdAo+IGluZGV4IDI3ZjBi
YjUuLmU0ZWY5OTQgMTAwNzU1Cj4gLS0tIGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRl
L3NjcmlwdHMvbG9jYXRlLXRlc3QKPiArKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3Vp
dGUvc2NyaXB0cy9sb2NhdGUtdGVzdAo+IEBAIC05Miw3ICs5Miw3IEBAIHJ1bm5hYmxlKQo+ICAg
ICMgd2FsdHogZG93biB0aGUgdG9vbHMgZGlyZWN0b3J5IGFuZCB0cnkgYW5kIGJ1aWxkIHQwICh3
aGljaCBkb2Vzbid0Cj4gICAgIyBtYWtlIHNlbnNlIGFzIGl0J3MgYSB0b29sLCBub3QgYSB0ZXN0
KS4gQmV0dGVyIGNyaXRlcmlvbiBuZWVkcyB0bwo+ICAgICMgYmUgZXN0YWJsaXNoZWQgZm9yIHRo
aXMgZmlsZS4KPiAtICAgIGZpbmQgIiRXSEVSRS9jb25mb3JtYW5jZSIgIiRXSEVSRS9zdHJlc3Mi
IC10eXBlIGYgLW5hbWUgJypbMC05XS5jJyAtbyAtbmFtZSAnWzAtOV0qLVswLTldKi5zaCcgfCBn
cmVwIC12IGJ1aWxkb25seSB8IGdyZXAgLXYgJ14uL3Rvb2xzJwo+ICsgICAgZmluZCAiJFdIRVJF
L2NvbmZvcm1hbmNlIiAiJFdIRVJFL3N0cmVzcyIgLXR5cGUgZiAtbmFtZSAnKlswLTlhLXpdLmMn
IC1vIC1uYW1lICdbMC05XSotWzAtOV0qLnNoJyB8IGdyZXAgLXYgYnVpbGRvbmx5IHwgZ3JlcCAt
diAnXi4vdG9vbHMnIHwgZ3JlcCAtdiAndGVzdGZybXcuYyQnCj4gICAgZmluZCAiJFdIRVJFL2Z1
bmN0aW9uYWwiIC10eXBlIGYgLW5hbWUgJyouYycKPiAgICA7Owo+IHRlc3QtdG9vbHMpCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvTWFrZWZpbGUg
Yi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3RyZXNzL01ha2VmaWxlCj4gaW5kZXgg
YjA5NTI3Zi4uZDY4NzJhOSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0
c3VpdGUvc3RyZXNzL01ha2VmaWxlCj4gKysrIGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1
aXRlL3N0cmVzcy9NYWtlZmlsZQo+IEBAIC01LDcgKzUsNyBAQAo+ICMKPiAKPiBhbGwgY2xlYW4g
aW5zdGFsbCB0ZXN0Ogo+IC0gICAgQGZvciBkaXIgaW4gYGxzIC1kICovTWFrZWZpbGUgMj4vZGV2
L251bGwgfCBzZWQgLWUgJ3MsL01ha2VmaWxlJCQsLGcnYDsgZG8gXAo+ICsgICAgQGZvciBkaXIg
aW4gYGZpbmQgLiAtbmFtZSAqTWFrZWZpbGUgfCBlZ3JlcCAtdiAnXi4vTWFrZWZpbGUnIHwgc2Vk
IC1lICdzLC9NYWtlZmlsZSQkLCxnJ2A7IGRvIFwKPiAgICAgICAgJChNQUtFKSAtQyAkJGRpciAk
QDsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICBkb25lCj4gCj4gLS0KPiAyLjYuMgo+
IAo+IAo+IC0tIAo+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
