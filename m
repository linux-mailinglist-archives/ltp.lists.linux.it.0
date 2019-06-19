Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E64B5B3
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 11:58:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C0463EA6A6
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 11:58:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 59B9E3EA2E7
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 11:58:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F10C6012C2
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 11:58:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65F59AEF8;
 Wed, 19 Jun 2019 09:58:06 +0000 (UTC)
Date: Wed, 19 Jun 2019 11:58:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190619095805.GC16577@rei.lan>
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190617150640.GD16831@rei>
 <CAOQ4uxithmPn6J=B2kaGKT0JOpqzyVEkHU+zMqhXCYnnH+ZHVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxithmPn6J=B2kaGKT0JOpqzyVEkHU+zMqhXCYnnH+ZHVQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
 sync test-cases
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

SGkhCj4gPiBXaXRoIHRoZXNlIG1vZGlmaWNhdGlvbiB0aGUgdGVzdCB3YXMgc3RhYmxlIGFuZCB3
b3JrZWQgZmluZSBmb3IgbW9yZQo+ID4gdGhhbiAxMDAgaXRlcmF0aW9ucyBmb3IgbWUuIEl0IHN0
aWxsIGZhaWxzIGZvciBGVVNFIGJhc2VkIGZpbGVzeXN0ZW1zCj4gPiBidXQgdGhhdCBpcyB0byBi
ZSBleHBlY3RlZCBzaW5jZSBGVVNFIGRvZXMgbm90IGltcGxlbWVudCBzeW5jX2ZpbGVfcmFuZ2UK
PiA+IHlldC4KPiA+Cj4gCj4gV2hhdCBpcyB0aGUgcHJvcG9zZWQgd2F5IHRvIHJlc29sdmUgdGhp
cyBmYWlsdXJlPwo+IElmIEZVU0UgZG9lcyBub3QgaW1wbGVtZW50IHN5bmNfZmlsZV9yYW5nZSwg
c2hvdWxkbid0IHRlc3QgZGV0ZWN0Cj4gaXQgYW5kIHJldHVybiBUQ09ORj8KCldlbGwgdGhlIGNh
bGwgcmV0dXJucyBzdWNjZXNzIGJ1dCBkb2VzIG5vdCBzeW5jIGFueXRoaW5nIG9uIEZVU0UgYmFz
ZWQKZmlsZXN5c3RlbXMgc28gdGhlIGNob2ljZXMgaGVyZSBhcmU6CgoxKSBEaXNhYmxlIHRoZSB0
ZXN0IG9mIEZVU0UKMikgS2VlcCB0aGUgdGVzdCBmYWlsaW5nIGFuZCBpZ25vcmUgdGhlIGZhaWx1
cmVzCgpXaGljaCBvbmUgZG8geW91IHByZWZlcj8KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0Bz
dXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
