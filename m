Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A42DBF0E
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:56:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3BCF3C57F1
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:56:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2F44A3C2B2E
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:56:01 +0100 (CET)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 499101000BDE
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:56:01 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0ED8340003;
 Wed, 16 Dec 2020 10:55:59 +0000 (UTC)
Date: Wed, 16 Dec 2020 11:55:58 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201216115558.2964253d@kmaincent-XPS-13-7390>
In-Reply-To: <6abb1c7a-47d7-97dd-96c2-665c1030a554@oracle.com>
References: <20201216094037.5886-1-kory.maincent@bootlin.com>
 <6abb1c7a-47d7-97dd-96c2-665c1030a554@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ipsec_lib.sh: test xfrm_user driver locally
 before rhost
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Alexey,

On Wed, 16 Dec 2020 13:31:36 +0300
Alexey Kodanev <alexey.kodanev@oracle.com> wrote:

> On 16.12.2020 12:40, Kory Maincent wrote:
> > First, test the presence of the driver locally to avoid a misleading TWARN
> > from tst_net_run in case of driver not present.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >  testcases/network/stress/ipsec/ipsec_lib.sh | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/testcases/network/stress/ipsec/ipsec_lib.sh
> > b/testcases/network/stress/ipsec/ipsec_lib.sh index 198c9315d..1db5fc6af
> > 100644 --- a/testcases/network/stress/ipsec/ipsec_lib.sh
> > +++ b/testcases/network/stress/ipsec/ipsec_lib.sh
> > @@ -83,8 +83,9 @@ ipsec_lib_setup()
> >  	ALGR=
> >  
> >  	if [ -n "$IPSEC_MODE" ]; then
> > -		tst_net_run "tst_check_drivers xfrm_user" || \
> > -			tst_brk TCONF "xfrm_user driver not available on
> > lhost or rhost"
> > +		tst_check_drivers xfrm_user || tst_brk TCONF "xfrm_user
> > driver not available"
> > +		tst_rhost_run -c "tst_check_drivers xfrm_user" || \
> > +			tst_brk TCONF "xfrm_user driver not available on
> > rhost"  
> 
> Hi Kory,
> 
> tst_net_run() checks the driver locally first, so I don't
> quite understand why do exactly the same what tst_net_run()
> supposed to do?

Indeed but it returns a TWARN because the command "tst_check_drivers xfrm_user"
not end properly, but in fact it should return a TCONF due to the missing
xfrm_drivers.
In the final result file we got a FAIL error with the value 36 in place of a
CONF with value 32 which should be the right message.

Regards,

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
