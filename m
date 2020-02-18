Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D8162200
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:06:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CCB13C254C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:06:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 19A3F3C03B1
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:06:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A2C8F1401864
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:06:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BEE3AD05;
 Tue, 18 Feb 2020 08:05:59 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:05:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200218080558.GA19384@dell5510>
References: <20200207112236.16462-1-mdoucha@suse.cz>
 <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
 <0090dabb-76fa-ea3d-2f96-4c4e50146bba@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0090dabb-76fa-ea3d-2f96-4c4e50146bba@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] Redesign TST_RETRY_FUNC()
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> On 2/8/20 7:35 AM, Li Wang wrote:
> > 1. We need to update the doc/test-writing-guidelines.txt=A0too.

> Right. I'll resubmit in a moment.
Thanks!

> > 2. Maybe better to let the shell version is consistent with this new?

> That doesn't make much sense. Shell programs and functions have much
> simpler call conventions than C functions. If you really need to test a
> more complex result than a single return value in shell, writing a
> wrapper function is much easier than writing a validator function.

> In C, it's the other way around. Writing a wrapper function would often
> be a ton of work compared to writing a simple retval validator macro.
+1.


Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
