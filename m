Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF517349C
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:55:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A3233C6AB6
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 10:55:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CB5753C2377
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:55:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 717CC2015B5
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 10:55:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 924E1ABE7;
 Fri, 28 Feb 2020 09:55:27 +0000 (UTC)
Date: Fri, 28 Feb 2020 10:55:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200228095525.GA11177@dell5510>
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-4-pvorel@suse.cz>
 <CAEemH2ddNJTjzvPgHvtwVTM0CeFYH2_wy7SeK90ZPDMvME9K5g@mail.gmail.com>
 <20200228084236.GA4925@dell5510>
 <513439094.9393483.1582881728087.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <513439094.9393483.1582881728087.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] doc: Update style guide to new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> > You often quote the style guide. What do you suggest?
> > Keep it or delete and move some of it's content to Test-Writing-Guidelines?
> > (which ones)?

> I'm fine with removing it, and move what's not covered to other docs.
Thanks for your ack.
To be honest I don't see much things left.
"Fixing Open Posix Testsuite" paragraph is not covered anywhere, but I wouldn't
care (not really sure where to put this + IMHO I'd prefer this project to be on
it's own).

For things like "Inline assigments" we get compiler warnings.

Maybe "System headers" note is worth. But actually, even this is outdated:
IMHO would be better to advice use our lapi headers (adding paragraph to
"2.2.1 Basic test structure"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
