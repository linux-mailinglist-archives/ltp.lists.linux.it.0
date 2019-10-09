Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03299D08C4
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:48:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C836D3C207E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9610B3C0DFD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:48:56 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A0DCA20116A
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:48:55 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 6840B9F679;
 Wed,  9 Oct 2019 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570607334; bh=x6LndBBlGhlskH8CGWbmeCWO5xsCZ84NzLCwgfqHyDA=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=uAD3ke1cDeb4w51ztG1Q20b9vydzUj5HYbupDXCn8Sm9yVmlYpl8wqnp+XBD5eF7u
 5Gdo+5jC42wlefGE5+TQ5AyZnNU6GG8s8BvPLjD4IEWGWGHIEF9m8SW8MjkOAeBH5T
 LVq0nk5EiVBlwnSKu6rr1s7TmzchEnOA2w9gJ8vs=
To: Petr Vorel <pvorel@suse.cz>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-2-lkml@jv-coder.de> <20191009073609.GB27854@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <c34e4432-ffe1-47a9-e93e-bce6b256072e@jv-coder.de>
Date: Wed, 9 Oct 2019 09:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009073609.GB27854@dell5510>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] tst_test.sh: Add TST_USES_MODULE
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4+IEFkZHMgYSBuZXcgbGlicmFyeSB2YXJpYWJsZSBUU1RfVVNFU19NT0RVTEUsIHRoYXQg
Y2FuIGJlIHVzZWQsIHdoZW4gYQo+PiB0ZXN0IG1heSBuZWVkIGEgbW9kdWxlLCBidXQgc2hvdWxk
IG5vdCBmYWlsLCBpZiB0aGUgbW9kdWxlIGlzIG5vdCBhdmFpbGFibGUuCj4gSSB3b25kZXIgaWYg
VFNUX1VTRVNfTU9EVUxFIGlzIGRlc2NyaXB0aXZlIGVub3VnaC4gQnV0IGl0IGxvb2tzIHRvIG1l
IGJldHRlcgo+IHRoYW4gVFNUX0dFVF9NT0RQQVRIICh3aGljaCBDeXJpbCBzdWdnZXN0ZWQgaW4g
djMpLgo+Cj4gV2Ugc2hvdWxkIHRoaW5rIHR3aWNlIGFzIF9VU0VTXyBrZXl3b3JkIHNob3VsZCBi
ZSB1c2VkIGNvbnNpc3RlbnRseSBmb3IgdGhlIHNhbWUKPiBhcHByb2FjaCBpbiBkaWZmZXJlbnQg
ZnVuY3Rpb25hbGl0eSAoaS5lLiBUU1RfVVNFU19GT08gaXMgdGhlIHNhbWUgYXMKPiBUU1RfTkVF
RFNfRk9PLCBidXQgbm90IFRDT05GL1RCUk9LIGlmIGl0IGZhaWxzKS4KPgo+IEJ1dCB3aG9sZSBj
b25jZXB0IG9mIFRTVF9VU0VTX0ZPTyBsb29rcyB0byBtZSBhIGJpdCBjb21wbGljYXRlZCwgaWYg
bmVlZGVkIG9ubHkKPiBmb3IgbW9kdWxlcy4gQ2Fubm90IHdlIGp1c3QgY2FsbCBfdHN0X2ZpbmRf
bW9kdWxlIGRpcmVjdGx5IGluIHRoaXMgY2FzZSBhbmQgbm90Cj4gaW50cm9kdWNlIHZhcmlhYmxl
PwpJIHdhcyB0aGlua2luZyBhYm91dCBhZGRpbmcgYSBmdW5jdGlvbiB0byBzZWFyY2ggZm9yIGEg
bW9kdWxlLCBidXQgCnN0cnVnZ2xlZCB3aXRoCnJldHVybmluZyB0aGUgbmFtZSBvZiB0aGUgZm91
bmQgZm91bmQgbW9kdWxlLgpJIGhhZCBzb21ldGhpbmcgbGlrZQpNT0RQQVRIPSQodHN0X2ZpbmRf
bW9kdWxlICIkTU9EVUxFX05BTUUiKQpidXQgdGhpcyBjYW5ub3QgdXNlIHRzdF9yZXMgb3IgdHN0
X2Jyaywgd2hpY2ggSSBkb24ndCBsaWtlLiBJIGFsc28gZG9uJ3QgCmxpa2UganVzdCBjYWxsaW5n
Cl90c3RfZmluZF9tb2R1bGUgYW5kIGdldHRpbmcgdGhlIHJlc3VsdCBpbiBzb21lICJtYWdpYyIg
dmFyaWFibGUuIFRoYXQgCmlzIHRoZSByZWFzb24Kd2h5IEkgd2VudCB3aXRoIEN5cmlsJ3MgSWRl
YSBvZiBhIHZhcmlhYmxlCj4gLi4uCj4+ICtfdHN0X2ZpbmRfbW9kdWxlKCkKPj4gK3sKPj4gKwls
b2NhbCBfdHN0X21vZHVsZT0kMQo+PiArCWxvY2FsIF90c3RfaXNfcmVxdWlyZWQ9JHsyOi0wfQo+
PiArCj4+ICsJZm9yIHRzdF9tb2R1bGUgaW4gIiRfdHN0X21vZHVsZSIgXAo+PiArCQkJCQkJIiRM
VFBST09UL3Rlc3RjYXNlcy9iaW4vJF90c3RfbW9kdWxlIiBcCj4+ICsJCQkJCQkiJFRTVF9TVEFS
VFdELyRfdHN0X21vZHVsZSI7IGRvCj4gbml0OiAoY2FuIGJlIGZpeGVkIGJ5IHBlcnNvbiB3aG8g
bWVyZ2VzIGl0KTogSXQncyBub3QgdmlzaWJsZSwgYnV0IHVzZXMgbW9yZQo+IHRhZ3MgdGhhbiBp
dCBzaG91bGQgYmUsIHNvIGl0IGxvb2tzIGxpa2U6Cj4gKyAgICAgICBmb3IgdHN0X21vZHVsZSBp
biAiJF90c3RfbW9kdWxlIiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIiRMVFBST09UL3Rlc3RjYXNlcy9iaW4vJF90c3RfbW9kdWxlIiBcCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiRUU1RfU1RBUlRX
RC8kX3RzdF9tb2R1bGUiOyBkbwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiBbIC1m
ICIkdHN0X21vZHVsZSIgXTsgdGhlbgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
VFNUX01PRFBBVEg9IiR0c3RfbW9kdWxlIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWsKPiArICAgICAgICAgICAgICAgICAgICAgICBmaQo+IEkgYWN0dWFsbHkgbGlrZSB0
aGUgb3JpZ2luYWwgYWxpZ25tZW50IGNyZWF0ZWQgYnkgQWxleGV5Ogo+ICAgICAgICAgIGZvciB0
c3RfbW9kdWxlIGluICIkVFNUX05FRURTX01PRFVMRSIgXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICIkTFRQUk9PVC90ZXN0Y2FzZXMvYmluLyRUU1RfTkVFRFNfTU9EVUxFIiBcCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIiRUU1RfU1RBUlRXRC8kVFNUX05FRURTX01PRFVMRSI7
IGRvCkp1c3QgYW4gYWNjaWRlbnQgYnkgbXkgZWRpdG9yLCBJJ2xsIGZpeCBpdCBmb3IgdjIKPgo+
PiArCj4+ICsJCQlpZiBbIC1mICIkdHN0X21vZHVsZSIgXTsgdGhlbgo+PiArCQkJCVRTVF9NT0RQ
QVRIPSIkdHN0X21vZHVsZSIKPj4gKwkJCQlicmVhawo+PiArCQkJZmkKPj4gKwlkb25lCj4+ICsK
Pj4gKwlpZiBbIC16ICIkVFNUX01PRFBBVEgiIF07IHRoZW4KPj4gKwkJaWYgWyAkX3RzdF9pc19y
ZXF1aXJlZCAtZXEgMSBdOyB0aGVuCj4+ICsJCQl0c3RfYnJrIFRDT05GICJGYWlsZWQgdG8gZmlu
ZCBtb2R1bGUgJyRfdHN0X21vZHVsZSciCj4+ICsJCWVsc2UKPj4gKwkJCXRzdF9yZXMgVElORk8g
Ik1vZHVsZSAnJF90c3RfbW9kdWxlJyBub3QgZm91bmQuIgo+IG5pdDogcGxlYXNlIGRyb3AgZG90
IGF0IHRoZSBlbmQgKGNhbiBiZSBmaXhlZCBieSBwZXJzb24gd2hvIG1lcmdlcyBpdCkuCkZpeGVk
IGZvciB2Mgo+PiArCQlmaQo+PiArCWVsc2UKPj4gKwkJdHN0X3JlcyBUSU5GTyAiRm91bmQgbW9k
dWxlIGF0ICckVFNUX01PRFBBVEgnIgo+PiArCWZpCj4KPiBuaXQ6IHRoaXMgaXMgSU1ITyBtb3Jl
IHJlYWRhYmxlCj4gCWlmIFsgLW4gIiRUU1RfTU9EUEFUSCIgXTsgdGhlbgo+IAkJdHN0X3JlcyBU
SU5GTyAiRm91bmQgbW9kdWxlIGF0ICckVFNUX01PRFBBVEgnIgo+IAkJcmV0dXJuCj4gCWZpCj4K
PiAJaWYgWyAkX3RzdF9pc19yZXF1aXJlZCAtZXEgMSBdOyB0aGVuCj4gCQl0c3RfYnJrIFRDT05G
ICJGYWlsZWQgdG8gZmluZCBtb2R1bGUgJyRfdHN0X21vZHVsZSciCj4gCWVsc2UKPiAJCXRzdF9y
ZXMgVElORk8gIk1vZHVsZSAnJF90c3RfbW9kdWxlJyBub3QgZm91bmQiCj4gCWZpCkl0IHdvdWxk
IHN0aWxsIGtlZXAgdGhlIGVsc2UgYW5kIG5vdCB1c2UgYSByZXR1cm4uIEluZGVudGF0aW9uIGNs
ZWFybHkgCnNob3dzIHdoYXQncyBnb2luZyBvbi4KQnV0IEkgYWdyZWUgdG8gaW52ZXJ0IHRoZSBs
b2dpYywgZmlyc3QgdGVzdGluZyB0aGUgZ29vZCBjYXNlLCB0aGFuIHRoZSBiYWQuCj4KPiBLaW5k
IHJlZ2FyZHMsCj4gUGV0cgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
