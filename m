Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 568673340D3
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:54:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D75AC3C6A21
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:54:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 522B13C0DF7
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:54:23 +0100 (CET)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C14771A01235
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=318Rq
 XTb9ZnKtUReC92RRulreg8OHruPh4yuDLEekUg=; b=gDolMynVZzpw433UZpLCe
 Lx2u3XFvqd1QLqenk6MkHPkkXLWEQh5G5lcM4GYjgBLNfq1oERcnjEFT5QRKfA9t
 m0fO0WKts6wTSKaWpMCaWPRT0LQooq6tAgu3znO2hfVUY0vjSSFt8HB1gn2+TlXR
 mWKsOJrcqvARcxSbQ3AxJA=
Received: from [172.20.10.4] (unknown [122.192.13.185])
 by smtp5 (Coremail) with SMTP id HdxpCgD3y7iZ3UhgNdAfBA--.4788S2;
 Wed, 10 Mar 2021 22:54:18 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
 <YEigO2gryF1Kp6Gq@pevik>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <b11680c3-7878-b06b-e87a-8991bd3cb305@163.com>
Date: Wed, 10 Mar 2021 22:54:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YEigO2gryF1Kp6Gq@pevik>
Content-Language: en-US
X-CM-TRANSID: HdxpCgD3y7iZ3UhgNdAfBA--.4788S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw18Jw1fKF13Cr4kArW7XFb_yoWDWwc_ua
 90kry5Zr4UJr1rZ3W3JFnxC3Z3K3W5JF9xXr1rta4Syw15X34akryDZr1SyrZ7Cws5KrsF
 krnavan0v347CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8gAw3UUUUU==
X-Originating-IP: [122.192.13.185]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMxpRXlXl8UBoKgAAsl
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMy8xMC8yMSA2OjMyIFBNLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpLAo+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFhpYW8gWWFuZyA8eWFuZ3guanlAY24uZnVqaXRzdS5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+Cj4+IC1zdGF0aWMgY29uc3QgY2hhciAqY29u
c3QgcmVzb3VyY2VfZmlsZXNbXSA9IHsKPj4gLQlURVNUX0FQUCwKPj4gLQlOVUxMLAo+PiAtfTsK
Pj4gLQo+PiAgIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPj4gICAJLnRlc3RfYWxs
ID0gdmVyaWZ5X2NyZWF0LAo+PiAgIAkubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+PiAgIAkuZm9y
a3NfY2hpbGQgPSAxLAo+PiAtCS5yZXNvdXJjZV9maWxlcyA9IHJlc291cmNlX2ZpbGVzLAo+PiAr
CS5yZXNvdXJjZV9maWxlcyA9IChjb25zdCBjaGFyICpjb25zdCBbXSkgewo+PiArCQlURVNUX0FQ
UCwKPiBEb24ndCB3ZSB3YW50IHRvIGRyb3AgVEVTVF9BUFAgZGVmaW5pdGlvbiBhbmQgdXNlIGZp
bGUgZGlyZWN0bHk/Cj4gSGF2aW5nIFRFU1RfQVBQIGRvZXMgbm90IHNheSBtdWNoLgoKSGkgUGV0
ciwKCgpJIGNhbiB1c2UgZmlsZSBuYW1lIGRpcmVjdGx5IGluIHYyIHBhdGNoLgoKRG8geW91IGFn
cmVlIHRvIHVzZSBhbm9ueW1vdXMgLnJlc291cmNlX2ZpbGVzIGZvciBub3fvvJ8gb3IgaXMgaXQg
YmV0dGVyIAp0byBrZWVwIGl0PwoKCj4gTm90IHN1cmUgaG93IGZhciB3ZSBzaG91bGQgZ28gd2l0
aCBtb3ZpbmcgZXZlcnl0aGluZyBpbnRvIGlubGluZSBhbm9ueW1vdXMKPiBkZWZpbml0aW9ucyAo
aXQnZCBiZSBuaWNlIGlmIGRvY3BhcnNlIHdhcyBhYmxlIHRvIGp1c3QgZXhwYW5kIG1hY3Jvcywg
YnV0IHRoYXQKPiB3b3VsZCBiZSB3YXkgdG9vIHNsb3cpLgoKSSBhZ3JlZSB0aGF0IGV4cGFuZGlu
ZyBtYWNyb3Mgb3Igc3RydWN0cyBpcyB0aGUgbmljZXIgd2F5IGJ1dAoKd2UgbmVlZCB0byBkbyBz
b21lIGludmVzdGlnYXRpb24gYWJvdXQgaXQuCgoKQmVzdCBSZWdhcmRzLAoKWGlhbyBZYW5nCgo+
Cj4gS2luZCByZWdhcmRzLAo+IFBldHIKPgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
