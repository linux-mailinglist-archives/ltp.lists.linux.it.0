Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1429939
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:48:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDDF33EA698
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:48:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B96F23EA5E2
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:48:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6FA436019F0
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:48:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57362AEB6;
 Fri, 24 May 2019 13:48:50 +0000 (UTC)
Date: Fri, 24 May 2019 15:48:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20190524134849.GB2251@rei>
References: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
 <1558684246-2658-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <b6b85048-ff36-9681-05bd-2131721efd4f@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6b85048-ff36-9681-05bd-2131721efd4f@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl05.c: New test for prctl() with
 PR_{SET, GET}_NAME
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

SGkhCj4gPiArCWlmIChzdHJjbXAodGMtPmV4cG5hbWUsIGJ1ZikpCj4gPiArCQl0c3RfcmVzKFRG
QUlMLAo+ID4gKwkJCSJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkICxleHBlY3RlZCAlcywgZ290
ICVzIiwgdGMtPmV4cG5hbWUsIGJ1Zik7Cj4gPiArCWVsc2UKPiA+ICsJCXRzdF9yZXMoVFBBU1Ms
Cj4gPiArCQkJInByY3RsKFBSX0dFVF9OQU1FKSBzdWNjZWVkZWQsIHRocmVhZCBuYW1lIGlzICVz
IiwgYnVmKTsKPiBIaSBYdSwKPiAKPiBJdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGNvbnRpbnVlIGlm
IGJ1ZiBtaXNtYXRjaGVzIHRjLT5leHBuYW1lLgo+IAo+ID4gKwo+ID4gKwl0aWQgPSB0c3Rfc3lz
Y2FsbChfX05SX2dldHRpZCk7Cj4gPiArCj4gPiArCXNwcmludGYoUFJPQ19OQU1FX1BBVEgsICIv
cHJvYy9zZWxmL3Rhc2svJWQvY29tbSIsIHRpZCk7Cj4gPiArCVNBRkVfRklMRV9TQ0FORihQUk9D
X05BTUVfUEFUSCwgIiVzIiwgY29tbV9idWYpOwo+IAo+IFlvdSBkaWRuJ3QgY3JlYXRlIG11bHRp
cGxlIHRocmVhZHMgaGVyZSBzbyBpdCBzZWVtcyBzaW1wbGVyIHRvIHVzZSAKPiAvcHJvYy9zZWxm
L2NvbW0KPiBpbnN0ZWFkIG9mIC9wcm9jL3NlbGYvdGFzay88dGlkPi9jb21tLiBkbyB5b3UgdGhp
bmsgc28/Cj4gUGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIHVybCBmb3IgZGV0YWlsczoKPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3Byb2MudHh0CgpBY3R1YWxseSB3
ZSBzaG91bGQgY2hlY2sgYm90aC4KCj4gQlRXOgo+IFNob3VsZCB3ZSBwcmludCB0aHJlZSBUUEFT
UyBtZXNzYWdlcyBmb3Igb25lIHRlc3Q/Cj4gQ2FuIHdlIHJlcGxhY2UgcHJldmlvdXMgVFBBU1Mg
d2l0aCBUSU5GTyBhbmQgdGhlbiBwcmludCBUUEFTUyBhdCB0aGUgZW5kPwoKSSB0aGluayB0aGF0
IGl0J3MgY2xlYW5lciB0byBwcmludCBQQVNTL0ZBSUwgbWVzc2FnZSBmb3IgZWFjaCBzdWJ0ZXN0
LgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
