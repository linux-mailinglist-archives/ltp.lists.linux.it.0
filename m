Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD0334505
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 18:21:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94FC23C4D72
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 18:21:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 657DB3C4B8C
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 18:21:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6348860062A
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 18:21:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A66AEAC1F;
 Wed, 10 Mar 2021 17:21:36 +0000 (UTC)
Date: Wed, 10 Mar 2021 18:21:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <YEkAH6xJlSK99bp+@pevik>
References: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
 <YEigO2gryF1Kp6Gq@pevik>
 <b11680c3-7878-b06b-e87a-8991bd3cb305@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b11680c3-7878-b06b-e87a-8991bd3cb305@163.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Use anonymous .resource_files for
 docparse
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywKCj4gT24gMy8xMC8yMSA2OjMyIFBNLCBQZXRyIFZvcmVsIHdyb3RlOgo+ID4gSGks
Cgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29t
Pgo+ID4gUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKPiA+ID4gLXN0
YXRpYyBjb25zdCBjaGFyICpjb25zdCByZXNvdXJjZV9maWxlc1tdID0gewo+ID4gPiAtCVRFU1Rf
QVBQLAo+ID4gPiAtCU5VTEwsCj4gPiA+IC19Owo+ID4gPiAtCj4gPiA+ICAgc3RhdGljIHN0cnVj
dCB0c3RfdGVzdCB0ZXN0ID0gewo+ID4gPiAgIAkudGVzdF9hbGwgPSB2ZXJpZnlfY3JlYXQsCj4g
PiA+ICAgCS5uZWVkc19jaGVja3BvaW50cyA9IDEsCj4gPiA+ICAgCS5mb3Jrc19jaGlsZCA9IDEs
Cj4gPiA+IC0JLnJlc291cmNlX2ZpbGVzID0gcmVzb3VyY2VfZmlsZXMsCj4gPiA+ICsJLnJlc291
cmNlX2ZpbGVzID0gKGNvbnN0IGNoYXIgKmNvbnN0IFtdKSB7Cj4gPiA+ICsJCVRFU1RfQVBQLAo+
ID4gRG9uJ3Qgd2Ugd2FudCB0byBkcm9wIFRFU1RfQVBQIGRlZmluaXRpb24gYW5kIHVzZSBmaWxl
IGRpcmVjdGx5Pwo+ID4gSGF2aW5nIFRFU1RfQVBQIGRvZXMgbm90IHNheSBtdWNoLgoKPiBIaSBQ
ZXRyLAoKCj4gSSBjYW4gdXNlIGZpbGUgbmFtZSBkaXJlY3RseSBpbiB2MiBwYXRjaC4KT0suIEkn
ZCBsaWtlIHRvIGtub3cgdGhlIG90aGVycyBvcGluaW9uIChwcmVjZWRlbnQpLgoKPiBEbyB5b3Ug
YWdyZWUgdG8gdXNlIGFub255bW91cyAucmVzb3VyY2VfZmlsZXMgZm9yIG5vd++8nyBvciBpcyBp
dCBiZXR0ZXIgdG8KPiBrZWVwIGl0PwpJIGd1ZXNzIHllcywgd2UndmUgYWxyZWFkeSBzdGFydGVk
IHRvIHVzZSBpdC4KCj4gPiBOb3Qgc3VyZSBob3cgZmFyIHdlIHNob3VsZCBnbyB3aXRoIG1vdmlu
ZyBldmVyeXRoaW5nIGludG8gaW5saW5lIGFub255bW91cwo+ID4gZGVmaW5pdGlvbnMgKGl0J2Qg
YmUgbmljZSBpZiBkb2NwYXJzZSB3YXMgYWJsZSB0byBqdXN0IGV4cGFuZCBtYWNyb3MsIGJ1dCB0
aGF0Cj4gPiB3b3VsZCBiZSB3YXkgdG9vIHNsb3cpLgoKPiBJIGFncmVlIHRoYXQgZXhwYW5kaW5n
IG1hY3JvcyBvciBzdHJ1Y3RzIGlzIHRoZSBuaWNlciB3YXkgYnV0Cgo+IHdlIG5lZWQgdG8gZG8g
c29tZSBpbnZlc3RpZ2F0aW9uIGFib3V0IGl0LgpnY2MgLUUgZm9vLmMgd291bGQgZG8gZXhwYW5z
aW9uIGZvciB1cy4gQnV0IG5vdCBzdXJlIGlmIGl0J3Mgd29ydGggb2YgcnVudGltZS4KQmVjYXVz
ZSBwcm9ibGVtIG9mIG1pc3NpbmcgZGVmaW5pdGlvbnMgd2lsbCBiZSBvbiBvdGhlciBwbGFjZXMg
YW5kIHdlIGRvbid0IHdhbnQKdG8gZ2V0IHJpZCBvZiBkZWZpbml0aW9ucy4gZS5nLiBJIHBsYW5u
ZWQgdG8gYWRkIHNvbWUgdGFnIGRlZmluaXRpb25zIChmb3IKImxpbnV4LWdpdCIsIC4uLikgYXMg
TWFydGluIERvdWNoYSBzdWdnZXN0ZWQsIGJ1dCB0aGlzIHdvdWxkIG5vdCB3b3JrIHVudGlsCndl
IGV4cGFuZCBtYWNyb3MuCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gQmVzdCBSZWdhcmRzLAoKPiBY
aWFvIFlhbmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
