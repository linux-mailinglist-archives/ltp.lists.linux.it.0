Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8DD3FF7
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:54:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80BEF3C1CFD
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:54:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0FA753C1453
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:54:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F1231A010F4
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:54:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2AE9AD07;
 Fri, 11 Oct 2019 12:54:15 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:54:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20191011125413.GA30000@dell5510>
References: <20191011095442.10541-1-pvorel@suse.cz>
 <20191011095442.10541-4-pvorel@suse.cz>
 <1570797394.4238.7.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570797394.4238.7.camel@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/5] shell: Add timeout shell API tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Clements,

thanks for your notes.

> > +DATA="
> > +timeout01.sh||0

> We only check if the lib doesn't produce any error, but we do not 
> check if timeout is really unlimited. But I think we can do so when 
> the shell-test-framework will be introduced and we can check for 
> "TINFO: Timeout per run is disabled" output.
Yes, I'd prefer to do more enhancements after shell-test-framework being
merged.

I plan to add also $(dirname $0) to PATH, so it can be run

-PATH="$(dirname $0)/../../../testcases/lib/:$PATH"
+PATH="$(dirname $0):$(dirname $0)/../../../testcases/lib/:$PATH"
...
-	LTP_TIMEOUT_MUL=$timeout ./$file
+	LTP_TIMEOUT_MUL=$timeout $file

And expect that shell-test-framework will handle this better.

> > +timeout02.sh||0
> > +timeout02.sh|foo|32
> > +timeout02.sh|2|0
> > +timeout02.sh|1.1|0
> > +timeout02.sh|-10|32

> I think it is worth to add these tests as well:

> timeout01.sh|2|0
> timeout02.sh|-1.1|32
> timeout02.sh|-10.1|32
> timeout02.sh|-0.1|0
OK, no problem to add them.

timeout02 1 TCONF: LTP_TIMEOUT_MUL must be number >= 1! (0)
BTW I wonder if TBROK shouldn't be used instead of TCONF.
Anybody strong opinion?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
