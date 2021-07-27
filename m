Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ACF3D7C3C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 19:35:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A205D3C912C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 19:35:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55B9F3C65B1
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 19:35:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7F3C31000A00
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 19:35:34 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A72512016C;
 Tue, 27 Jul 2021 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627407333;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gwfGzndxc0v3rVPtbu14/Egbeg1Eor4CcbAyg4FwIXM=;
 b=Yy9ZQNei7RuNaBpZ3zOfwY/FJBj8Y5+dgqGrrDeUh1mZpMR0LwltqDm77IYis2bjsh7XEV
 wJKN8rAPY6foVGNUnS3M3mcI+tXpRj83VHVwBHFKS+kfe2aTkROCkCYqofh78RPsOfGayi
 kIeppyu2ub5QlnVaZ0RthcZPzgJpO60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627407333;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gwfGzndxc0v3rVPtbu14/Egbeg1Eor4CcbAyg4FwIXM=;
 b=az2P3c5aQpxQPFRaJegWEhf63cGUSFcL6jGZ6ml0yD8sPr1VG/NPQol0Z0WERSMQeFX6Yx
 t3gSwQ/pbldXvvBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6C1C013CF4;
 Tue, 27 Jul 2021 17:35:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wt6rF+VDAGHuQgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jul 2021 17:35:33 +0000
Date: Tue, 27 Jul 2021 19:35:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YQBD4w2nKwY2G1l+@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

Hi Alexey,

> On 14.07.2021 17:07, Petr Vorel wrote:
> > net_stress.broken_ip runtest file is correct, but some users try to run
> > tests manually.

> > Fixes: #843

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  testcases/network/stress/broken_ip/broken_ip-checksum | 3 ++-
> >  testcases/network/stress/broken_ip/broken_ip-fragment | 3 ++-
> >  testcases/network/stress/broken_ip/broken_ip-ihl      | 3 ++-
> >  testcases/network/stress/broken_ip/broken_ip-nexthdr  | 3 ++-
> >  testcases/network/stress/broken_ip/broken_ip-protcol  | 3 ++-
> >  5 files changed, 10 insertions(+), 5 deletions(-)

> > diff --git a/testcases/network/stress/broken_ip/broken_ip-checksum b/testcases/network/stress/broken_ip/broken_ip-checksum
> > index 78f00ce98..707ffcb29 100644
> > --- a/testcases/network/stress/broken_ip/broken_ip-checksum
> > +++ b/testcases/network/stress/broken_ip/broken_ip-checksum
> > @@ -1,11 +1,12 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> > -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> > +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
> >  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> >  # Copyright (c) International Business Machines  Corp., 2006
> >  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV4_ONLY=1
> >  . tst_net.sh

> >  do_test()
> > diff --git a/testcases/network/stress/broken_ip/broken_ip-fragment b/testcases/network/stress/broken_ip/broken_ip-fragment
> > index 1f5e5f713..7356bb523 100644
> > --- a/testcases/network/stress/broken_ip/broken_ip-fragment
> > +++ b/testcases/network/stress/broken_ip/broken_ip-fragment
> > @@ -1,11 +1,12 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> > -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> > +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
> >  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> >  # Copyright (c) International Business Machines  Corp., 2006
> >  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV4_ONLY=1
> >  . tst_net.sh

> >  do_test()
> > diff --git a/testcases/network/stress/broken_ip/broken_ip-ihl b/testcases/network/stress/broken_ip/broken_ip-ihl
> > index 9f2a42568..e5e41ee8e 100644
> > --- a/testcases/network/stress/broken_ip/broken_ip-ihl
> > +++ b/testcases/network/stress/broken_ip/broken_ip-ihl
> > @@ -1,11 +1,12 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> > -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> > +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
> >  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> >  # Copyright (c) International Business Machines  Corp., 2006
> >  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV4_ONLY=1
> >  . tst_net.sh

> >  do_test()
> > diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr b/testcases/network/stress/broken_ip/broken_ip-nexthdr
> > index 475b92b16..2ab0601ac 100644
> > --- a/testcases/network/stress/broken_ip/broken_ip-nexthdr
> > +++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr
> > @@ -1,11 +1,12 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> > -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> > +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
> >  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> >  # Copyright (c) International Business Machines  Corp., 2006
> >  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV6_ONLY=1

> +TST_IPV6=6 won't work to fix #843?

> >  . tst_net.sh

> >  do_test()
> > diff --git a/testcases/network/stress/broken_ip/broken_ip-protcol b/testcases/network/stress/broken_ip/broken_ip-protcol
> > index a91cdaaeb..9f9275f03 100644
> > --- a/testcases/network/stress/broken_ip/broken_ip-protcol
> > +++ b/testcases/network/stress/broken_ip/broken_ip-protcol
> > @@ -1,11 +1,12 @@
> >  #!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> > -# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
> > +# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
> >  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> >  # Copyright (c) International Business Machines  Corp., 2006
> >  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV4_ONLY=1
> >  . tst_net.sh

> >  do_test()

> The generic version looks fine:

> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
needed or accept this patchset. Both would work.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
