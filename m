Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B8124540
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 12:03:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FB313C243D
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 12:03:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4BD393C220C
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 12:03:47 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 79174142A345
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 12:03:46 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 023449F892;
 Wed, 18 Dec 2019 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1576667025; bh=5dbZhGROJkYyAKv+JPVz09laPWRF/7YBqd1enoslR5o=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=D4MFvQO/tVWtvBWRiHht6H4GVNDM7qqXCq629k27cepM6SUx5Qy3rbXtXW5wQ6dGM
 tM4VY2Y/3WHzNjjYtE0az3zZKdBZCwaD1VDolPpubDaYqxcoCct/kFfUxbu0lM/g4M
 o048JlM0ceaHO7SEsVT2K6VB8w9vXJDHcZs1jNVA=
To: Petr Vorel <pvorel@suse.cz>
References: <20191209093659.31996-1-lkml@jv-coder.de>
 <20191218103927.GA26489@dell5510> <20191218105920.GB26489@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3b6c187d-7e72-8d9a-ae42-189bedc3098d@jv-coder.de>
Date: Wed, 18 Dec 2019 12:03:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218105920.GB26489@dell5510>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] isofs: Convert to new library
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCnRoYW5rcyBmb3IgbWVyZ2luZwo+PiBZb3UgY29ycmVjdGx5IHJlbW92ZWQgZ2V0
b3B0IG9wdGlvbnM6IC1uIGp1c3Qgc2V0IE5PX0NMRUFOVVAsIHdoaWNoIGlzIG5vdCB1c2VkCj4+
IGFueSBtb3JlIG9uIHRlc3Quc2guIEJvdGggbGlicmFyaWVzIHN1cHBvcnQgVFNUX05PX0NMRUFO
VVAsIHNvIHdlIHNob3VsZAo+PiBkb2N1bWVudCBpdCAoZ29pbmcgdG8gc2VuZCBhIHBhdGNoKS4K
PiBJbiB0aGUgZW5kIEkganVzdCBtZXJnZWQgdGhhdCBzaW1wbGUgZG9jIGNoYW5nZS4KPiBJIHdv
bmRlciBpZiB0aGVyZSB3b3VsZCBiZSB1c2UgZm9yIHZhcmlhYmxlIGtlZXBpbmcgJFRTVF9UTVBE
SVIgKGJlY2F1c2UgaXQncwo+IGRlbGV0ZWQgZXZlbiB3aXRoICRUU1RfTk9fQ0xFQU5VUCkuCkkg
dGhpbmsgdGhhdCB3YXMgdGhlIHJlYXNvbiB3aHkgSSBjb21wbGV0ZWx5IHJlbW92ZWQgdGhlIGZs
YWcgaW4gdGhlIApmaXJzdCBwbGFjZS4KQWxzbyBJIGRpZCBub3Qgc2VlIGFueSByZWFzb24gdG8g
a2VlcCB0aGUgdGVtcGRpci4gSWYgSSBldmVyIG5lZWRlZCB0aGlzIAppbiB0aGUgcGFzdCwgSSBq
dXN0IG1vZGlmaWVkIHRoZSB0ZXN0LgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
