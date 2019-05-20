Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C4238AB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 15:47:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA0A0294ABC
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 15:47:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8C6C8294A8D
 for <ltp@lists.linux.it>; Mon, 20 May 2019 15:47:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 75253601649
 for <ltp@lists.linux.it>; Mon, 20 May 2019 15:47:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C79ECAD5C
 for <ltp@lists.linux.it>; Mon, 20 May 2019 13:47:49 +0000 (UTC)
Date: Mon, 20 May 2019 15:47:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190520134748.GA19968@dell5510>
References: <20190423193823.4580-1-pvorel@suse.cz>
 <20190520120848.GA27675@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520120848.GA27675@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/1] net: Introduce TST_GET_UNUSED_PORT() macro
 into C API
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

SGkgQ3lyaWwsCgo+IEhpIQo+IExvb2tzIGdvb2QsIGFja2VkLgpUaGFua3MsIG1lcmdlZCB3aXRo
IHlvdXIgYWNrLgoKPiBCdHcgdGhlIGx0cGFwaWNtZCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgZ2V0
IGVpdGhlciByZW1vdmVkIChpbiBhIGNhc2UKPiB0aGF0IGl0IHdpbGwgYmUgbm8gbG9uZ2VyIHVz
ZWQpIG9yIHdlIHNob3VsZCBjb252ZXJ0IGl0IHRvIGEgc3RhbmRhbG9uZQo+IGhlbHBlciB0aGUg
dGVzdGNhc2VzL2xpYi8gZGlyZWN0b3J5LiBCdXQgdGhhdCBpcyBzb21ldGhpbmcgdGhhdCBzaG91
bGQKPiBiZSBkb25lIGluIGEgc2VwcmF0ZSBwYXRjaC4uLgpPSywgZ29pbmcgdG8gcHVzaCBwYXRj
aCBpbXBsZW1lbnRpbmcgaXQuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
