Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CAA3FD94D
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 14:16:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34EFC3C99E5
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 14:16:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D938B3C2963
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:16:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EDE781400DAF
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:16:00 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1407E22535;
 Wed,  1 Sep 2021 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630498560;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fI1Jnus8dKXHqPJuzg+vVziknOUvy+U9d+7fduucg4s=;
 b=z5oxuvGx1XX8lY0i/Hw9XqYvKoGV8AM9LKFMfBE3gDQQgmPLUa1WsUqZqZdN+ZJyXtAIrM
 Qcd/j0eVpPxJKwMQvXFv/SPtseA05caEp7iI3MKOFbVQjZvZPDJTW63/mB3tGdOEqWNZHv
 EHg7L1X6Xu9zaO5jE/d/cUYjbPbGzz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630498560;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fI1Jnus8dKXHqPJuzg+vVziknOUvy+U9d+7fduucg4s=;
 b=ENU9XuH6IXEaxzztusXrxDHyiumPuTVECAgQSuL58zIixAK1aoa3cc84Sw6FiCnwWiWCKj
 EIedvkFhPopQDNDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CCA6C13A5E;
 Wed,  1 Sep 2021 12:15:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6tTxL/9uL2GtSAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 12:15:59 +0000
Date: Wed, 1 Sep 2021 14:15:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YS9u/k/b7lM/l1ki@pevik>
References: <20201116220325.413764-1-pvorel@suse.cz>
 <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/route: Rewrite route-rmmod to new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

...
> > diff --git a/testcases/network/stress/route/route-rmmod.sh b/testcases/network/stress/route/route-rmmod.sh
...
> > +setup()
> > +{
> > +	tst_res TINFO "adding IPv$TST_IPVER route destination and delete network driver $ROUTE_CHANGE_IP times"
> > +}

> It is probably unsafe to go straight to the do_test() and removing
> the veth... it would be nice to check that it is indeed using default
> ltp netns, and veth not used for other interfaces, TCONF otherwise...

> Perhaps in init_ltp_netspace(), create a special symlink in the if block,
> where the default ltp netns created:

> if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
>    ...
>    ROD ln -s /var/run/netns/ltp_ns /var/run/netns/ltp_ns_default
>    ...
> }

> then check via this function:

> is_ltp_ns_default()
> {
> 	test -f /var/run/netns/ltp_ns_default
> }


> BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
> and remove that driver, so that this test can be run with custom setup, and
> with remote host setup?

Looking into this old patch, it looked to me quite bad approach to move
add_macvlan() into tst_net.sh to be reused (you didn't suggested that, that's
what I'd do to prevent the duplicity).

But much better approach would be IMHO to move virt_add() and virt_add_rhost()
from virt_lib.sh to tst_net.sh and adjust it not to be too tight to virt_lib.sh.
I suppose $virt_type should became $2 (second parameter).

Also there could be moved from virt_lib.sh to tst_net.sh: e.g. add flag
TST_NET_ADD_VIRT_TYPE (e.g. macvlan, gre, ...) and doing setup and cleanup
there. We could reduce code and document which virt drivers are used.

route-change-netlink-if is the only test which needs to call tst_init_iface()
(to add routes), virt_lib.sh does not need it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
