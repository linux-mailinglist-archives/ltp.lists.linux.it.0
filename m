Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8362B8C8B
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:50:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 852A93C2F62
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:50:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0883E3C2E66
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:50:52 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7E944200745
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:50:52 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E38C6A07FE;
 Thu, 19 Nov 2020 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605772251; bh=5LACoAV0RFnzWLPHnZVJ2ZJbHxyJxoVZpRaRUfqf8iw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=l7f3142JBkwhW1G+7tXidUFm6OTsV0pRidQ+XtzFHzr81Z9AZERr17DHfDKpJIIjE
 w7IehkaEgB6XsnwbC/H5BOfEmMj1Fuh4eEuJZb/+LSktGYHNj4bqzTQWECvz4evMlv
 x5H2msglOnTs3C0tlk9oIS+zIGx8x/OwiVW5ziDc=
To: Petr Vorel <pvorel@suse.cz>
References: <20201117124320.783802-1-lkml@jv-coder.de>
 <20201117124320.783802-2-lkml@jv-coder.de> <20201118212737.GC182229@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <359cb444-267e-47ba-7fb0-2146798b2b79@jv-coder.de>
Date: Thu, 19 Nov 2020 08:50:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201118212737.GC182229@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 2/3] network/stress/multicast/query-flood:
 Convert to new API
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

SGkgUGV0ciwKCj4+ICsjIFZlcmlmeSB0aGF0IHRoZSBrZXJuZWwgaXMgbm90IGNyYXNoZWQgd2hl
biBqb2luaW5nIGEgbXVsdGljYXN0IGdyb3VwCj4+ICsjIG9uIGEgc2luZ2xlIHNvY2tldCwgdGhl
biByZWNlaXZpbmcgYSBsYXJnZSBudW1iZXIgb2YgR2VuZXJhbCBRdWVyaWVzCj4gbml0OiBzb21l
IHNvcnQgb2YgdGhlIGRlc2NyaXB0aW9uIGNvdWxkIGJlIGluCj4gdHN0X3Rlc3QgVElORk8gbWVz
c2FnZSBpbiBkb19zZXR1cCgpIC8gZG9fdGVzdCgpCkkgcmVtb3ZlZCB0aGlzLCBiZWNhdXNlIEkg
dGhvdWdoIGl0IHdhcyB1c2VsZXNzLCBidXQgd2lsbCBhZGQgaXQgYmFjayBpbi4KPj4gK1RTVF9O
RUVEU19ST09UPTEKPj4gKy4gbWNhc3QtbGliLnNoCj4+ICsKPj4gK2RvX3NldHVwKCkKPj4gK3sK
Pj4gKwltY2FzdF9zZXR1cCAkTUNBU1ROVU1fTk9STUFMCj4+ICt9Cj4+ICsKPj4gK2RvX3Rlc3Qo
KQo+PiArewo+PiArCWxvY2FsIG1jYXN0X2FkZHJfcHJlZml4PSIkTUNBU1RfSVBWNF9BRERSX1BS
RUZJWCIKPj4gKwlbICIkVFNUX0lQVjYiIF0gJiYgbWNhc3RfYWRkcl9wcmVmaXg9IiRNQ0FTVF9J
UFY2X0FERFJfUFJFRklYIgo+IG5pdDogbWF5YmUganVzdCAkcHJlZml4IGlzIGVub3VnaC4KQUNL
Cj4+ICsKPj4gKwkjIFJ1biBhIG11bHRpY2FzdCBqb2luIHRvb2wKPj4gKwlsb2NhbCB0bXBmaWxl
PSQkCj4gUGxlYXNlLCB3aGVuIHlvdSBuZWVkIHRlbXBvcmFyeSBmaWxlcywgdXNlCj4gVFNUX05F
RURTX1RNUERJUj0xClRoYXQncyBhY3R1YWxseSBzZXQgaW4gbWNhc3QtbGliLnNoLCBidXQgZHVw
bGljYXRpb24gbWFrZXMgc2Vuc2UgaGVyZSBJIApndWVzcy4KPj4gKwlFWFBFQ1RfUEFTUyAkTUNB
U1RfTENNRCAtbiAxIC1wICRtY2FzdF9hZGRyX3ByZWZpeCBcPiAkdG1wZmlsZQo+PiArCXRzdF9y
ZXMgVElORk8gImpvaW5lZCAkKGdyZXAgZ3JvdXBzICR0bXBmaWxlKSIKPj4gKwo+PiArCSMgU2Vu
ZCBHZW5lcmFsIFF1ZXJ5IGZyb20gdGhlIHJlbW90ZSBob3N0Cj4+ICsJbG9jYWwgcGFyYW1zPSIi
Cj4gbml0OiBubyBuZWVkIHRvIGFkZCA9IiIKQUNLCgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
