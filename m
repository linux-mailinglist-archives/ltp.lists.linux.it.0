Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEA23AC0
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:46:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 316D32B0C94
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 16:46:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 19D7C2B02FB
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:46:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A0DF86017CB
 for <ltp@lists.linux.it>; Mon, 20 May 2019 16:46:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E95EFAFF4
 for <ltp@lists.linux.it>; Mon, 20 May 2019 14:46:46 +0000 (UTC)
Date: Mon, 20 May 2019 16:46:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190520144645.GD28976@rei.lan>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520143135.GA27341@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gMikgR2xpYmMgYWRkcyBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBvZiBjb3B5X2ZpbGVf
cmFuZ2UoKSwgdXNlZCBhcyBmYWxsYmFjawo+IHdoZW4ga2VybmVsIDwgNC41ICh3aGljaCBicm91
Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBbMV0uIEkgZ3Vlc3MgdGhlcmUgaXMgbm8gd2F5Cj4gdG8g
dXNlIGl0IGV4cGxpY2l0bHkgOiguCgpXZWxsIHdlIGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0g
dGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBvcGVyYXRpb24sCnNvIHJ1bm5pbmcgdGhlIHRlc3Qg
Zm9yIGFsbCBmaWxlc3lzdGVtcyBzaG91bGQgZ2V0IHRoZSBlbXVsYXRpb24gY292ZXJlZApmb3Ig
c3VyZS4uLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
