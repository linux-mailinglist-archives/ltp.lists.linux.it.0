Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B04F242625
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 14:42:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73E55294AD6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 14:42:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3DEA63EA36B
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 14:42:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38203602060
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 14:42:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81B95AF7F
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 12:42:20 +0000 (UTC)
Date: Wed, 12 Jun 2019 14:42:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190612124219.GA27163@x230>
References: <20190508112822.27255-1-camann@suse.com>
 <20190509074134.GA22704@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509074134.GA22704@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/rt_sigqueueinfo01: rewrote testcase
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

SGkgQ2hyaXN0aWFuLAoKPiA+IFRoZSBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiBvbmx5IHRlc3Rl
ZCBpZiB0aGUgc3lzY2FsbCBjYW4KPiA+IGJlIGNhbGxlZCBhdCBhbGwuIE5vdyBpdCBhbHNvIGNo
ZWNrcyBpZiB0aGUgY29ycmVjdCBzaWduYWwKPiA+IGFuZCBkYXRhIGlzIHNlbnQgYW5kIHJlY2Vp
dmVkLgoKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29t
Pgo+IEFja2VkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KCk1lcmdlZCwgdGhhbmtz
IGZvciB5b3VyIHdvcmshCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
