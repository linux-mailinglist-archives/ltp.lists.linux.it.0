Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE341504AA
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:38:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90ADB3C1820
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:38:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5F49D3C0638
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:38:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E99821000604
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:38:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 840F1AF49;
 Mon, 24 Jun 2019 08:38:45 +0000 (UTC)
Date: Mon, 24 Jun 2019 10:38:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190624083844.GA29809@rei.lan>
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <98bc3a5d9591387964b913c497f930a11ea4f7a8.1561018312.git.mbobrowski@mbobrowski.org>
 <20190621140009.GA26200@rei.lan>
 <CAOQ4uxjUtmrAfjwxhSU3g3QJ-2Nk9795pdT=nd8Mza_ETo+_2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjUtmrAfjwxhSU3g3QJ-2Nk9795pdT=nd8Mza_ETo+_2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v5 2/4] syscalls/fanotify14: new test to validate
 FAN_REPORT_FID interface return values
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

SGkhCj4gSGkgQ3lyaWwsCj4gCj4gdjUgc2VyaWVzIGhhcyA0IHBhdGNoZXMgYW5kIEkgb25seSBz
ZWUgeW91IGFwcGxpZWQgdGhlIDMgZmlyc3QgcGF0Y2hlcy4KPiBUaGlzIG9uZSB3YXMgbm90IGFw
cGxpZWQ6Cj4gCj4gc3lzY2FsbHMvZmFub3RpZnkxMzogYWRkIHRlc3QgY292ZXJhZ2UgZm9yIGZz
aWQgY2FjaGUgYnVnCgpMb29rcyBsaWtlIHRoZSBsYXN0IG9uZSBkaWRuJ3QgbWFrZSBpdCB0byBt
eSBtYWlsYm94LCB0aGUgc2VyaWVzIGVuZHMKd2l0aCAzLzQsIHNvcnJ5IEkgaGF2ZW4ndCBub3Rp
Y2VkLgoKTWF0dGhldyBjYW4geW91IHBsZWFzZSByZXNlbmQgdGhlIGxhc3Qgb25lPwoKLS0gCkN5
cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
