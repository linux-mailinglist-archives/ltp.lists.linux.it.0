Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C241173452
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:41:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB6C23C6ABF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:41:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 622CF3C2457
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:41:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 24EDF1A01E2A
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:41:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,495,1574092800"; d="scan'208";a="84723815"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 17:41:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 80FB549DF127;
 Fri, 28 Feb 2020 17:31:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 17:41:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200221160351.GA26393@rei.lan>
 <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
 <20200224142034.GA2210@rei>
 <1d62bf3e-3f34-fd05-8662-08ff16523673@cn.fujitsu.com>
Message-ID: <9e73a02e-7169-7229-8bc0-2ac84129bf31@cn.fujitsu.com>
Date: Fri, 28 Feb 2020 17:41:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1d62bf3e-3f34-fd05-8662-08ff16523673@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 80FB549DF127.AEC95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/fcntl30: clean up && add more
 range test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCgo+IEhpCj4gCj4+IEhpIQo+Pj4+IEkgd2FzIHBsYXlpbmcgd2l0aCB0aGUgdGVzdCBhbmQg
aXQgc2VlbXMgdGhhdCB0aGUga2VybmVsIGFsbG9jYXRpb24gbWF5Cj4+Pj4gZmFpbCBldmVuIGZv
ciBtdWNoIHNtYWxsZXIgc2l6ZXMgZm9yIHZhcmlvdXMgcmVhc29ucy4gSSBndWVzcyB0aGF0Cj4+
Pj4gbWVtb3J5IGZyYW1lbnRhdGlvbiBvbiBsb25nIHJ1bm5pbmcgc3lzdGVtcyBtYXkgYmUgdGhl
IGN1bHByaXQgaGVyZQo+Pj4+IGJlY2F1c2Uga21hbGxvYygpIGFsbG9jYXRlcyBwaHlzaWNhbGx5
IGNvbnRpbnVvdXMgbWVtb3J5Lgo+Pj4+Cj4+Pj4gSSBndWVzcyB0aGF0IHRoZSBzYWZlc3QgYmV0
IGhlcmUgd291bGQgYmUgbGltaXRpbmcgdGhlIG1heGltYWwgc2l6ZSB3ZQo+Pj4+IHRyeSB0byBy
ZXNpemUgdGhlIHBpcGUgYW5kIHN1Y2NlZWQgdG8gc29tZXRoaW5nIGFzIDhNQiB3aGljaCB3b3Vs
ZCBiZQo+Pj4+IHNvbWV0aGluZyBhcyAzMiBwYWdlcyB0byBhbGxvY2F0ZS4KPj4+Pgo+Pj4gQWdy
ZWUuCj4+Pj4gQXQgdGhlIHNhbWUgdGltZSBJIHdvdWxkIGp1c3QgZGVmaW5lIHRoZSBzaXplIHdl
IGV4cGVjdCB0byBmYWlsIHdpdGgKPj4+PiBFTk9NRU0gdG8gMTw8MzAgYW5kIHRoYXQgd291bGQg
c2F2ZSB1cyBmcm9tIHRoaXMgYXJjaGl0ZWN0dXJlIHNwZWNpZmljCj4+Pj4gdHJpY2tlcnkgdGhh
dCB3aWxsIHByb2JhYmx5IGZhaWwgb24gc3RyYW5nZXIgYXJjaGl0ZWN0dXJlcyBhbnl3YXkuCj4+
PiBPbiA2NGtiIHBhZ2Ugc2l6ZSwgaXQgd2lsbCBvdmVyIDEgPDwzMCBmb3IgRU5PTUVNIGVycm9y
IC5JIHRoaW5rIHdlIGNhbgo+Pj4gdGVzdCBNQVhfU0laRStwZ19zaXplKDwgMTw8MzEpIGZvciBF
Tk9NRU0gZXJyb3IuIElmwqAgYmV5b25kIDE8PDMxLAo+Pj4gZXhwZWN0IEVJTlZBTCBlcnJvci4K
Pj4KPj4gSG1tLCBtYXliZSB3ZSBjYW4ganVzdCBkb3VibGUgdGhlIHNpemUgaW4gYSBsb29wIHVu
dGlsIHdlIGhpdCBlaXRoZXIKPj4gRU5PTUVNIG9yIEVJTlZBTCB0aGVuIGFuZCBmYWlsIHRoZSB0
ZXN0IGlmIHdlIGhpdCB0aGVtIHRvbyBzb29uLgo+IEkgcGxhbiB0byByZW1vdmUgdGhpcyBtYXgg
dGVzdCBiZWNhdXNlIG9mIHVua25vd24ga21hbGxvYyBmYWlsLCB0ZXN0IAo+IHJhbmdlIGFzIGJl
bG93Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHswLCAwLCAwLCAxLCAic2V0IGEgdmFsdWUgb2YgYmVs
b3cgcGFnZSBzaXplIn0sCj4gIMKgwqDCoMKgwqDCoMKgIHswLCAwLCAwLCAxLCAic2V0IGEgbm9y
bWFsIHZhbHVlIn0swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vdW5kZXIgCj4gbm9uLXByaXZp
bGVnZWQgdXNlcixtYXliZSAxMjhrICg8MTAyNGsgKQo+ICDCoMKgwqDCoMKgwqDCoCB7MCwgMCwg
MSwgMSwgInNldCBhIHZhbHVlIG9mIGJlbG93IHBhZ2Ugc2l6ZSJ9LAo+ICDCoMKgwqDCoMKgwqDC
oCB7MCwgMCwgMSwgMSwgInNldCBhIG5vcm1hbCB2YWx1ZSJ9LMKgwqDCoCAvLyB0ZXN0IDhNIGFz
IHlvdSAKPiBzdWdnZXN0ZWQsCj4gIMKgwqDCoMKgwqDCoMKgIHswLCAwLCAxLCAwLCAic2V0IGEg
dmFsdWUgYmV5b25kIG1heCJ9LMKgIC8vZXhwZWN0IEVJTlZBTCBvciBFTk9NRU0KPiB9Owo+IAo+
IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0PwpQaW5nLgpkaWZmIGFzIGJlbG93OgpkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMwLmMgCmIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMwLmMKaW5kZXggODYwZDQyZThkLi4yOGNk
ZWUxNjUgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwz
MC5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzMC5jCkBAIC0z
MSw4ICszMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGNhc2UgewogICAgICAgICB7MCwgMCwgMCwgMSwg
InNldCBhIHZhbHVlIG9mIGJlbG93IHBhZ2Ugc2l6ZSJ9LAogICAgICAgICB7MCwgMCwgMCwgMSwg
InNldCBhIG5vcm1hbCB2YWx1ZSJ9LAogICAgICAgICB7MCwgMCwgMSwgMSwgInNldCBhIHZhbHVl
IG9mIGJlbG93IHBhZ2Ugc2l6ZSJ9LAotICAgICAgIHswLCAwLCAxLCAxLCAic2V0IGEgbm9ybWFs
IHZhbHVlIn0sCi0gICAgICAgezAsIDAsIDEsIDEsICJzZXQgYSBtYXggdmFsdWUifSwKKyAgICAg
ICB7MCwgMCwgMSwgMSwgInNldCBhIG5vcm1hbCB2YWx1ZSg4TSkifSwKICAgICAgICAgezAsIDAs
IDEsIDAsICJzZXQgYSB2YWx1ZSBiZXlvbmQgbWF4In0sCiAgfTsKCkBAIC0xNDUsMTMgKzE0NCwx
MCBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogICAgICAgICB0Y2FzZXNbMl0uc2V0c2l6ZSA9
ICgxIDw8IHBnX3NoaWZ0KSAtIDE7CiAgICAgICAgIHRjYXNlc1syXS5leHBzaXplID0gMSA8PCBw
Z19zaGlmdDsKCi0gICAgICAgdGNhc2VzWzNdLnNldHNpemUgPSAyIDw8IHBnX3NoaWZ0OwotICAg
ICAgIHRjYXNlc1szXS5leHBzaXplID0gMiA8PCBwZ19zaGlmdDsKKyAgICAgICB0Y2FzZXNbM10u
c2V0c2l6ZSA9IDEgPDwgMjM7CisgICAgICAgdGNhc2VzWzNdLmV4cHNpemUgPSAxIDw8IDIzOwoK
LSAgICAgICB0Y2FzZXNbNF0uc2V0c2l6ZSA9IDEgPDwgc2hpZnQ7Ci0gICAgICAgdGNhc2VzWzRd
LmV4cHNpemUgPSAxIDw8IHNoaWZ0OwotCi0gICAgICAgdGNhc2VzWzVdLnNldHNpemUgPSAoMSA8
PCBzaGlmdCkgKyAxOworICAgICAgIHRjYXNlc1s0XS5zZXRzaXplID0gKDEgPDwgc2hpZnQpICsg
MTsKCiAgICAgICAgIHB3ID0gU0FGRV9HRVRQV05BTSgibm9ib2R5Iik7CiAgfQoKQmVzdCBSZWdh
cmRzCllhbmcgWHUKPiAKPiBCZXN0IFJlZ2FyZHMKPiBZYW5nIFh1Cj4+Cj4gCj4gCj4gCgoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
