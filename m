Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAAE30E7D
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:03:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8F07390292
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:03:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 072E8390272
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:03:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EA2E41A010FF
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:03:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36D44ACEE;
 Fri, 31 May 2019 13:03:22 +0000 (UTC)
Date: Fri, 31 May 2019 15:03:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190531130321.GB12608@rei.lan>
References: <20190531095659.22796-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531095659.22796-1-xzhou@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls: testing on all fs for copy_file_range02
 and getxattr04
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

SGkhCj4gVG8gaW5jcmVhc2UgdGVzdCBjb3ZlcmFnZS4gSWYgdGhlIHRlc3RpbmcgZnMgaXMgbm90
IHN1cHBvcnRpbmcKPiB0aGlzIHN5c2NhbGwsIHRjYXNlIGhhbmRsZXMgaXQgd2VsbC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0LmNvbT4KPiAtLS0KPiAgdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIu
YyB8IDIgKy0KPiAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXR4YXR0ci9nZXR4YXR0cjA0
LmMgICAgICAgICAgICAgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jCj4gaW5kZXgg
MDdjMDIwN2MyLi5kM2ZiNzM3YmUgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwo+ICsrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAyLmMKPiBA
QCAtMTEzLDYgKzExMyw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiAgCS5u
ZWVkc19yb290ID0gMSwKPiAgCS5tb3VudF9kZXZpY2UgPSAxLAo+ICAJLm1udHBvaW50ID0gTU5U
UE9JTlQsCj4gLQkuZGV2X2ZzX3R5cGUgPSAiZXh0NCIsCj4gKwkuYWxsX2ZpbGVzeXN0ZW1zID0g
MSwKPiAgCS50ZXN0X3ZhcmlhbnRzID0gVEVTVF9WQVJJQU5UUywKPiAgfTsKCkFjdHVhbGx5IGxv
b2tpbmcgYXQgdGhlIGtlcm5lbCBjb2RlIGFsbCB0aGVzZSBlcnJvciBjaGVja3MgYXJlIGRvbmUg
aW4KdGhlIHZmc19jb3B5X2ZpbGVfcmFuZ2UoKSBmdW5jdGlvbiBzbyBhcyBmYXIgYXMgSSBjYW4g
dGVsbCB0aGVyZSBpcyBubwpwb2ludCBpbiBydW5uaW5nIGNvcHlfZmlsZV9yYW5nZTAyIHRlc3Qg
Zm9yIGFsbCBmaWxlc3lzdGVtcy4gTWF5YmUgd2UKY2FuIGp1c3QgZGVsZXRlIGFsbCB0aGUgZGV2
aWNlIGNvZGUgYW5kIGNoYW5nZSB0aGUgdGVzdCB0byB1c2UgdGhlCmRlZmF1bHQgVE1QRElSIGlu
c3RlYWQ/CgpJdCB3b3VsZCBtYXkgbXVjaCBtb3JlIHNlbnNlIHRvIHJ1biB0aGUgY29weV9maWxl
X3JhbmdlMDEgYW5kCmNvcHlfZmlsZV9yYW5nZTAzIGZvciBhbGwgZmlsZXN5c3RlbXMsIGJlY2F1
c2UgdGhlc2UgdGVzdHMgYWR2YW5jZQpiZXlvbmQgdGhlIGNvbW1vbiBjaGVja3MgYW5kIGFjdHVh
bGx5IGNvcHkgdGhlIGZpbGUgd2hpY2ggaW52b2tlcwplaXRoZXIgdGhlIGZfb3AtPmNvcHlfZmls
ZV9yYW5nZSgpIG9yIHRoZSBkb19zcGxpY2VfZGlyZWN0KCkgZmFsbGJhY2suCgo+IGRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDQuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0eGF0dHIvZ2V0eGF0dHIwNC5jCj4gaW5kZXggMWRj
YjE0ZGEzLi45MDVhYmQ1ODcgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9nZXR4YXR0ci9nZXR4YXR0cjA0LmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2dldHhhdHRyL2dldHhhdHRyMDQuYwo+IEBAIC0xMjEsNyArMTIxLDcgQEAgc3RhdGljIHN0cnVj
dCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAJLm5lZWRzX3RtcGRpciA9IDEsCj4gIAkubmVlZHNfcm9v
dCA9IDEsCj4gIAkubW91bnRfZGV2aWNlID0gMSwKPiAtCS5kZXZfZnNfdHlwZSA9ICJ4ZnMiLAo+
ICsJLmFsbF9maWxlc3lzdGVtcyA9IDEsCj4gIAkubW50cG9pbnQgPSBNTlRQT0lOVCwKPiAgCS5m
b3Jrc19jaGlsZCA9IDEsCj4gIAkudGVzdF9hbGwgPSB2ZXJpZnlfZ2V0eGF0dHIsCgpDYW4geW91
IHBsZWFzZSBzcGxpdCB0aGUgcGF0Y2g/CgpJdCdzIGEgYml0IGNsZWFuZXIgKGFuZCBlYXNpZXIg
d2hlbiB3ZSBoYXZlIHRvIHJldmVydCkgdG8gZW5hYmxlIHRoZQphbGxfZmlsZXN5c3RlbSBmbGFn
cyBmb3IgZWFjaCBzeXNjYWxsIGluIGEgc2VwYXJhdGUgcGF0Y2guCgotLSAKQ3lyaWwgSHJ1Ymlz
CmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
