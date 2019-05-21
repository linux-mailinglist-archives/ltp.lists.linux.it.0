Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F225159
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:01:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 233EF294A89
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:01:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 51B0F3EA691
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:01:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A160F1401B3D
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:01:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF352AF8E;
 Tue, 21 May 2019 14:01:20 +0000 (UTC)
Date: Tue, 21 May 2019 16:01:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190521140118.GC19326@rei.lan>
References: <20190520214911.1460-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520214911.1460-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lapi/ustat.h: Replace daddr_t with long
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

SGkhCj4gZGFkZHJfdCBpcyB1c3VhbGx5IHR5cGVkZWYgdG8gX19rZXJuZWxfZGFkZHJfdCwKPiB3
aGljaCBpcyBpbnQgb3IgbG9uZy4KCldlbGwgdGhlIHNpemUgbXVzdCBtYXRjaCwgc28gdW5sZXNz
IHlvdSBoYXZlIGNoZWNrZWQgdGhhdCBpdCdzIGRlZmluZWQKdG8gaW50IG9ubHkgaW4gY2FzZXMg
d2hlcmUgc2l6ZW9mKGludCkgPT0gc2l6ZW9mKGxvbmcpIHRoaXMgY2hhbmdlIGlzCm5vdCBjb3Jy
ZWN0LgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
