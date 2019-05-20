Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23A230E0
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 12:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2065B2D0135
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 12:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 10AF0298791
 for <ltp@lists.linux.it>; Mon, 20 May 2019 12:02:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EFEE96017D7
 for <ltp@lists.linux.it>; Mon, 20 May 2019 12:02:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05869AFBE;
 Mon, 20 May 2019 10:02:08 +0000 (UTC)
Date: Mon, 20 May 2019 12:02:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20190520100207.GC25405@rei.lan>
References: <20190520032018.GW31424@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520032018.GW31424@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, lkp@01.org,
 Roman Gushchin <guro@fb.com>, ltp@lists.linux.it
Subject: Re: [LTP] [mm]  8c7829b04c: ltp.overcommit_memory01.fail
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

SGkhCj4gY29tbWl0OiA4Yzc4MjliMDRjNTIzY2RjNzMyY2I3N2Y1OWYwMzMyMGUwOWYzMzg2ICgi
bW06IGZpeCBmYWxzZS1wb3NpdGl2ZSBPVkVSQ09NTUlUX0dVRVNTIGZhaWx1cmVzIikKClRoaXMg
aGFzIGJlZW4gcmVwb3J0ZWQgb24gdGhlIExUUCBNTCBhbHJlYWR5LCBMVFAgdGVzdHMgbmVlZHMg
dG8gYmUKYWRqdXN0ZWQsIHNlZToKCmh0dHA6Ly9saXN0cy5saW51eC5pdC9waXBlcm1haWwvbHRw
LzIwMTktTWF5LzAxMTk2Mi5odG1sCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
