Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709E23BFB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:24:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEE402987AB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:24:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 35222298791
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:24:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D543D1A010BA
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:24:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF60FAD8F
 for <ltp@lists.linux.it>; Mon, 20 May 2019 15:24:01 +0000 (UTC)
Date: Mon, 20 May 2019 17:24:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190520152400.GA11845@dell5510>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520144645.GD28976@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+ID4gMikgR2xpYmMgYWRkcyBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBvZiBjb3B5X2Zp
bGVfcmFuZ2UoKSwgdXNlZCBhcyBmYWxsYmFjawo+ID4gd2hlbiBrZXJuZWwgPCA0LjUgKHdoaWNo
IGJyb3VnaHQgY29weV9maWxlX3JhbmdlKCkpIFsxXS4gSSBndWVzcyB0aGVyZSBpcyBubyB3YXkK
PiA+IHRvIHVzZSBpdCBleHBsaWNpdGx5IDooLgoKPiBXZWxsIHdlIGNhbiBhbHdheXMgdXNlIGZp
bGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBvcGVyYXRpb24sCj4gc28gcnVubmlu
ZyB0aGUgdGVzdCBmb3IgYWxsIGZpbGVzeXN0ZW1zIHNob3VsZCBnZXQgdGhlIGVtdWxhdGlvbiBj
b3ZlcmVkCj4gZm9yIHN1cmUuLi4KT2gsIHRoYXQncyB0aGUgd2F5IDopLgpNZXJnZWQgdGhlbiwg
dGhhbmtzIGZvciB5b3VyIHBhdGNoLCBDaHJpc3RpYW4uCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
