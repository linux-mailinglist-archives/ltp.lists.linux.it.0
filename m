Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10E5B7CD
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 11:17:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2D8E3C1DAA
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 11:17:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 908123C1D75
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 11:17:50 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A37E91000BEB
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 11:17:42 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x619HCcq032279
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 1 Jul 2019 02:17:22 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 1 Jul 2019 02:17:01 -0700
To: Jan Stancek <jstancek@redhat.com>, <ltp@lists.linux.it>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
Date: Mon, 1 Jul 2019 17:16:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmtzIGZvciB5b3VyIHdvcmsuCgpJIHdpbGwgYmFja3BvcnQgdGhlIHBhdGNoIHRvIG15IHBy
b2plY3QgYWZ0ZXIgbWVyZ2VkLgoKCi0tSG9uZ3poaQoKCgpPbiA2LzI4LzE5IDc6MDkgUE0sIEph
biBTdGFuY2VrIHdyb3RlOgo+Cj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+PiAqTHRw
OioKPj4KPj4gbGF0ZXN0IG1hc3Rlcgo+Pgo+Pgo+PiAqS2VybmVsOioKPj4KPj4gQWZ0ZXIgdjUu
MSBBUkNIPW1pcHM2NAo+Pgo+Pgo+PiAqRXJyb3IgaW5mbzoqCj4+Cj4+IGRpb3Rlc3Q0IDEwIFRC
Uk9LIDogZGlvdGVzdDQuYzozNjg6IGNhbid0IG1tYXAgZmlsZTogSW52YWxpZCBhcmd1bWVudAo+
PiBkaW90ZXN0NCAxMSBUQlJPSyA6IGRpb3Rlc3Q0LmM6MzY4OiBSZW1haW5pbmcgY2FzZXMgYnJv
a2VuCj4+Cj4+Cj4+IEkgdGhpbmsgdGhlIGZpcnN0IGFyZ3VtZW50IG9mIG1tYXAgaXMgaW52YWxp
ZC4KPj4KPj4gICDCoMKgID5zaG1fYmFzZSA9IChjaGFyICopKCgobG9uZylzYnJrKDApICsgKHNo
bXN6IC0gMSkpICYgfihzaG1zeiAtIDEpKTsKPj4KPj4gICDCoMKgID5zaG1fYmFzZSA9IG1tYXAo
c2htX2Jhc2UsIDB4MTAwMDAwLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAo+IEkgZG9uJ3Qgc2Vl
IGFueSBub3RlIHdoeSB0aGF0IG1tYXAgbmVlZHMgdG8gYmUgTUFQX0ZJWEVELiBJJ2QgZHJvcCBp
dCwKPiBsZXQga2VybmVsIHBpY2sgYW4gYWRkcmVzczoKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9k
aXJlY3RfaW8vZGlvdGVzdDQuYwo+IGluZGV4IGU0NjE2ZTQwMGFiZC4uYmYyMDBjZDQxYTI3IDEw
MDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMKPiAr
KysgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4gQEAgLTM1Miwx
OCArMzUyLDE0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAgICAg
dG90YWwrKzsKPgo+ICAgICAgICAgIC8qIFRlc3QtMTA6IHJlYWQsIHdyaXRlIHRvIGEgbW1hcGVk
IGZpbGUgKi8KPiAtICAgICAgIHNobV9iYXNlID0gKGNoYXIgKikoKChsb25nKXNicmsoMCkgKyAo
c2htc3ogLSAxKSkgJiB+KHNobXN6IC0gMSkpOwo+IC0gICAgICAgaWYgKHNobV9iYXNlID09IE5V
TEwpIHsKPiAtICAgICAgICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJzYnJrIGZh
aWxlZDogJXMiLCBzdHJlcnJvcihlcnJubykpOwo+IC0gICAgICAgfQo+ICAgICAgICAgIG9mZnNl
dCA9IDQwOTY7Cj4gICAgICAgICAgY291bnQgPSBidWZzaXplOwo+ICAgICAgICAgIGlmICgoZmQg
PSBvcGVuKGZpbGVuYW1lLCBPX0RJUkVDVCB8IE9fUkRXUikpIDwgMCkgewo+ICAgICAgICAgICAg
ICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJjYW4ndCBvcGVuICVzOiAlcyIsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICBmaWxlbmFtZSwgc3RyZXJyb3IoZXJybm8pKTsKPiAgICAg
ICAgICB9Cj4gLSAgICAgICBzaG1fYmFzZSA9IG1tYXAoc2htX2Jhc2UsIDB4MTAwMDAwLCBQUk9U
X1JFQUQgfCBQUk9UX1dSSVRFLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIE1BUF9TSEFSRUQg
fCBNQVBfRklYRUQsIGZkLCAwKTsKPiArICAgICAgIHNobV9iYXNlID0gbW1hcCgwLCAweDEwMDAw
MCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKPiArICAgICAgICAgICAgICAgICAgICAgICBNQVBf
U0hBUkVELCBmZCwgMCk7Cj4gICAgICAgICAgaWYgKHNobV9iYXNlID09IChjYWRkcl90KSAtIDEp
IHsKPiAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBjbGVhbnVwLCAiY2FuJ3QgbW1h
cCBmaWxlOiAlcyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJlcnJvcihlcnJubykp
Owo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
