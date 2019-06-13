Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CC443EA
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:34:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 605DF294B04
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 18:34:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BC868294AC0
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:34:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 008561A00F3E
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 18:34:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16F60ADD9;
 Thu, 13 Jun 2019 16:34:22 +0000 (UTC)
Date: Thu, 13 Jun 2019 18:34:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190613163418.GB24675@dell5510>
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190613131018.GA29926@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613131018.GA29926@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] inotify: Add SAFE_MYINOTIFY_INIT{,
	1}() helpers
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

SGkgQ3lyaWwsCgo+IFRoZXNlIHR3byBwYXRjaGVzIGFyZSBvYnZpb3VzbHkgT0suClRoYW5rcyBm
b3IgcmV2aWV3LgoKPiBXZWxsIEkgd2Ugd2VyZSBwZWRhbnRpYyB0aGUgbGljZW5jZSBjaGFuZ2Ug
c2hvdWxkIGJlIGluIGEgc2VwYXJhdGUKPiBwYXRjaCwgYnV0IEkgZ3Vlc3MgdGhhdCBpdCdzIGZp
bmUgYXMgaXQgaXMuCkknbGwgcmVwbGFjZSBsaWNlbnNlIHRleHQgdG8gU1BEWCBpbiBhbGwgdGVz
dHMgdXNpbmcgbmV3IEFQSSBpbiBzZXBhcmF0ZSBjb21taXQuCgo+IEFsc28gd2Ugc2hvdWxkIHBy
b2JhYmx5IHN3aXRjaCB0byB0aGUgaW5vdGlmeV9pbml0KCkgZnJvbSBzeXMvaW5vdGlmeS5oCj4g
YW5kIGRyb3AgdGhlIG15IGZyb20gdGhlIGZ1bmN0aW9ucyBhbmQgbWFjcm9zLCBidXQgdGhhdCBj
b3VsZCBiZSBkb25lIGluCj4gYSBzdWJzZXF1ZW50IHBhdGNoLgpNZXJnZWQuIEknbGwgZG8gaXQg
aW4gYSBzZXBhcmF0ZSBwYXRjaC4KCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
