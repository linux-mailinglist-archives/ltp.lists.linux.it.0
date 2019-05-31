Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDA30E13
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:26:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B1BE3EA365
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:26:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 041643EA04A
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:26:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BF6AB600684
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:26:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70BBEAD76;
 Fri, 31 May 2019 12:26:32 +0000 (UTC)
Date: Fri, 31 May 2019 14:26:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190531122630.GA12608@rei.lan>
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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

SGkhCj4gSSBoYXZlIG5vIG9iamVjdGlvbiBvbiB0aGlzLiBCdXQsIGlzIHRoZXJlIHJlYWxseSBt
YWtlIHNlbnNlIHRvIHRlc3Qgc29tZQo+IG1vcmUgbm9uIHJlZ3VsYXIgZmlsZXMgd2hpY2ggbm90
IGJlaW5nIG1lbnRpb25lZCBieSBMaW51eCBNYW51YWwgUGFnZT8KPiAKPiBUaGUgY29weV9maWxl
X3JhbmdlMDIgdGVzdCBlcnJvcnMgYXJlIGFsbCBleHRyYWN0IGZyb20gbWFudWFsIHBhZ2UsIEkK
PiBjb21tZW50ZWQgdGhhdCBpbiBDaHJpc3RpYW4ncyBmaXJzdCBwYXRjaCB2ZXJzaW9uLiBBbmQg
SSBkb24ndCB0aGluayBpdCdzCj4gbmVjZXNzYXJ5IHRvIHRlc3QgdW5kZWZpbmVkIGJlaGF2aW9y
IGluIHN5c2NhbGwgdXNpbmcsIGJlY2F1c2UgaG93IGRvIHdlCj4ga25vdyB3aGF0IGVycm9yIHJl
dHVybiBpcyB0aGUgZXhwZWN0ZWQ/CgpUaGF0J3Mgbm90IHVuZGVmaW5lZCB0aGF0J3MgdW5kb2N1
bW1lbnRlZCBhdCBiZXN0LiBUaGUga2VybmVsIGNvZGUgZm9yCnZmc19jb3B5X2ZpbGVfcmFuZ2Ug
ZG9lczoKCiAgICAgICAgaWYgKFNfSVNESVIoaW5vZGVfaW4tPmlfbW9kZSkgfHwgU19JU0RJUihp
bm9kZV9vdXQtPmlfbW9kZSkpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJU0RJUjsKICAgICAg
ICBpZiAoIVNfSVNSRUcoaW5vZGVfaW4tPmlfbW9kZSkgfHwgIVNfSVNSRUcoaW5vZGVfb3V0LT5p
X21vZGUpKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgpXaGljaCBtZWFucyB0aGF0
IGRpcmVjdG9yaWVzIGFyZSB0cmVhdGVkIGFzIHNwZWNpYWwgaGVyZSBhbmQgYWxsIG90aGVyIGZp
bGUKZGVzY3JpcHRvcnMgdGhhdCBhcmUgbm90IHJlZ3VsYXIgZmlsZXMgYXJlIHN1cHBvc2VkIHRv
IGZhaWwgd2l0aCBFSU5WQUwuCgpTbyBhcyBmYXIgYXMgSSBjYW4gdGVsbCBpdCBtYWtlcyBzZW5z
ZSB0byBwYXNzIGEgcGlwZSBmZCBmb3IgZXhhbXBsZSBhbmQgY2hlY2sKZm9yIEVJTlZBTC4gQW5k
IHdlIHNob3VsZCBkbyB0aGF0IGJvdGggZm9yIGluX2ZkIGFuZCBvdXRfZmQgYXMgd2VsbC4KCi0t
IApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
