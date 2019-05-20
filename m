Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FA2323D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 13:24:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84D782987AD
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 13:24:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7087A298798
 for <ltp@lists.linux.it>; Mon, 20 May 2019 13:24:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F20A1000C4E
 for <ltp@lists.linux.it>; Mon, 20 May 2019 13:24:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 184F7ABD0;
 Mon, 20 May 2019 11:24:54 +0000 (UTC)
Date: Mon, 20 May 2019 13:24:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190520112451.GB25813@rei.lan>
References: <20190404141611.15192-1-chrubis@suse.cz>
 <20190520100824.GA25813@rei.lan>
 <CAOQ4uxgNGK=QcGcmDpjt0jhWC9=E3egSpv5G0-7tXx7bKQD7gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgNGK=QcGcmDpjt0jhWC9=E3egSpv5G0-7tXx7bKQD7gw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/preadv203: Add basic RWF_NOWAIT test
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

SGkhCj4gPiBQaW5nLCBhbnlib2R5IGhhcyBhbnkgY29tbWVudHMgb3IgY2FuIGJlIHRoaXMgYmUg
dGhpcyBtZXJnZWQ/Cj4gPgo+IAo+IEkgaGF2ZSBubyBvYmplY3Rpb24gdG8gdGhpcyB0ZXN0LCBi
dXQgSSBoYXZlIGEgcXVlc3Rpb24uIFlvdXIgY2xhaW0gaXM6Cj4gIldlIGFyZSBhdHRlbXB0aW5n
IHRvIHRyaWdnZXIgdGhlIEVBR0FJTiBwYXRoIGZvciB0aGUgUldGX05PV0FJVCBmbGFnLiIKPiAK
PiBTZWVtcyBsaWtlIHlvdSBoYXZlIGdvbmUgdG8gYSBncmVhdCBsZW5ndGggb2YgZWZmb3J0IHRv
IGFjaGlldmUgdGhpcy4KPiBXb3VsZG4ndCBpdCBiZSBzdWZmaWNpZW50IHRvIGRvIGEgc2luZ2xl
IHByZWFkdjIgYWZ0ZXIgZnN5bmMrZHJvcF9jYWNoZXMgaW4KPiBvcmRlciB0byBvYnNlcnZlIEVB
R0FJTj8KCkFzIGZhciBhcyBJIGNhbiB0ZWxsIHRoZSBJL08gdG8gdGhlIGRldmljZSBoYXMgdG8g
YmUgc2F0dXJhdGVkIGluIG9yZGVyCnRvIGdldCBFQUdBSU4gYXQgbGVhc3QgZm9yIGEgc3Vic2V0
IG9mIGZpbGVzeXN0ZW1zLiBJZiBJIGp1c3QgZHJvcCB0aGUKY2FjaGUgb25jZSB0aGVuIGF0dGVt
cHQgdG8gcmVhZCB3aXRoIHRoZSBOT1dBSVQgZmxhZyBpdCBzdHJhbmdlbHkgd29ya3MKb25seSBm
b3IgZXh0MiBmb3IgbWUuCgpTbyBJIGd1ZXNzIHRoYXQgdGhlIG1hbnVhbCBwYWdlIGlzIGEgYml0
IG1pc2xlYWRpbmcgYW5kIHRoZSBOT1dBSVQgZmxhZwphY3R1YWxseSByZXR1cm5zIEVBR0FJTiBv
bmx5IGlmIHRoZSBjYWxsaW5nIHRocmVhZCB3b3VsZCBlbmQgdXAgaW4gYQpxdWV1ZSBvciB3YWl0
aW5nIGZvciBhIGxvY2ssIGJ1dCBJIGhhdmVuJ3QgbG9va2VkIGludG8gdGhlIGtlcm5lbCBjb2Rl
CnRvIG1ha2Ugc3VyZS4KCj4gVGhlcmUgYXJlIHNldmVyYWwgb3RoZXIgd2F5cyB0byBnZXQgRUFH
QUlOLCBsaWtlIERJTyByZWFkL3dyaXRlIHdoZW4KPiBwYWdlIGNhY2hlICppcyogcG9wdWxhdGVk
LgoKVGhhdCBpcyBhIGdvb2QgaGludCwgSSB3aWxsIGhhdmUgYSBsb29rIGF0IHRoYXQgY2FzZSBh
cyB3ZWxsLgoKPiBRdWVzdGlvbiBpcywgaG93IG11Y2ggaXMgdGhlIHRlc3QgdHJ5aW5nIHRvIGNv
dmVyLgoKV2VsbCBpZGVhbGx5IHdlIHNob3VsZCBleGNlcmNpc2UgYXMgbXVjaCBrZXJuZWwgY29k
ZSBwYXRocyBhcwpwb3NzaWJsZS4uLiA6LSkKCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNl
LmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
