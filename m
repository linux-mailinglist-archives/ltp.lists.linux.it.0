Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC96F454E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 15:41:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7BDF3CB91F
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 15:41:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BD193CB8CE
 for <ltp@lists.linux.it>; Tue,  2 May 2023 15:41:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6F17A1000455
 for <ltp@lists.linux.it>; Tue,  2 May 2023 15:41:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AC172208E;
 Tue,  2 May 2023 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683034893;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aC50C3cuRaMuVOl+QWShRVwCtZbIE/6U+kD41Yvzm+4=;
 b=o9X9PrrNxLgFqfbqMX2zIL0Sx+w/1a4dqjydIEtZi4aQlRssKJiizLCGiVHP/vNyve2i70
 amVHBbZE1+CDtwkk9+i2wH95LhUfoLkD/9FXZtXC4157w/CjdFL/09Xm89faXcC0PbGs2H
 ZFZ7N2GTiPTHJ7EAlclFoIs5JU1J890=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683034893;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aC50C3cuRaMuVOl+QWShRVwCtZbIE/6U+kD41Yvzm+4=;
 b=f3KxuUqy1ya73FWAEFLDFxoDCtKkzAENzw3q5GPlQtg5fN2N+Cuijqfq8iw+i7CidXTZDb
 J2MI703NGxSX8zAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21F77134FB;
 Tue,  2 May 2023 13:41:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GbPyBg0TUWR4YwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 May 2023 13:41:33 +0000
Date: Tue, 2 May 2023 15:41:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230502134146.GA3654451@pevik>
References: <20230502075921.3614794-1-pvorel@suse.cz>
 <d441b9f9dfcbb4719d97c7b3b5950dfeeb8913d2.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d441b9f9dfcbb4719d97c7b3b5950dfeeb8913d2.camel@kernel.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] nfslock01.sh: Don't test on NFS v3 on TCP
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 linux-nfs@vger.kernel.org, NeilBrown <neilb@suse.de>,
 Steve Dickson <steved@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

[ Cc Steve, Alexey, Nikita - hope the new address is the correct,
because nikita.yushchenko@virtuozzo.com is dead ]

> On Tue, 2023-05-02 at 09:59 +0200, Petr Vorel wrote:
> > nfs_flock (run via nfslock01.sh) is known to fail on NFS v3 [1]:

> >     not unsharing /var makes AF_UNIX socket for host's rpcbind to become
> >     available inside ltp_ns. Then, at NFS v3 mount time, kernel creates
> >     an instance of lockd for ltp_ns, and ports for that instance leak to
> >     host's rpcbind and overwrite ports for lockd already active for root
> >     namespace. This breaks nfs3 file locking.


> Yeccchhh...that is pretty nasty.

> rpcbind was obviously written in a time before namespaces were even a
> thought to anyone. I wonder if there is something we can do in rpcbind
> itself to guard against these sorts of shenanigans? Probably not, I
> guess...

Maybe Steve or Neil have some idea.

> Is /var shared between namespaces in this test for some particular
> reason?

I hope I got , we talk about /var/run/netns/ltp_ns, which is symlink to
/proc/$pid/ns/net. Or is it really about /run/rpcbind.sock vs
/var/run/rpcbind.sock?

/var/run/netns/<NETNS> file is something created by ip:

#define NETNS_RUN_DIR "/var/run/netns" [1]

NETNS_RUN_DIR?=/var/run/netns [2]

man ip-netns(8) [3]
       By convention a named network namespace is an object at
       /var/run/netns/NAME that can be opened. The file descriptor
       resulting from opening /var/run/netns/NAME refers to the
       specified network namespace. Holding that file descriptor open
       keeps the network namespace alive. The file descriptor can be
       used with the setns(2) system call to change the network
       namespace associated with a task.

LTP used to use ip for creating namespaces. Later Alexey added reused custom
LTP code ns_exec.c and ns_ifmove.c [4] (NOTE: these were recently renamed to
tst_ns_exec.c and tst_ns_ifmove.c and moved) in order to allow to reuse already
defined namespaces. This change did the symlink from /proc/$pid/ns/net
/var/run/netns/ltp_ns, to keep the convention.

> > Before bd512e733 ("nfs_flock: fail the test if lock/unlock ops fail")
> > it run indefinitely with "unhandled error -107":
> > [ 2840.099565] lockd: cannot monitor 10.0.0.2
> > [ 2840.109353] lockd: cannot monitor 10.0.0.2
> > [ 2843.286811] xs_tcp_setup_socket: connect returned unhandled error -107
> > [ 2850.198791] xs_tcp_setup_socket: connect returned unhandled error -107

> > bd512e733 caused an early abort (therefore only "cannot monitor 10.0.0.2"
> > appears).

> > Although there is suggestion, how to fix the problem in kernel [2]:

> >     > Maybe rpcb_create_local() shall detect that it is not in root
> >     > netns, and only try AF_INET connection to > localhost in that case.

> >     That would be simple and might be sensible.  IF changing the AF_UNIX
> >     path to "/run/rpcbind.sock" isn't sufficient, then testing for the
> >     root_ns is probably the best second option.


> Was it determined that changing the location of the socket wasn't
> sufficient to fix this? FWIW, My Fedora 38 machine seems to listen on
> that socket already:

>     [Socket]
>     ListenStream=/run/rpcbind.sock

NOTE both openSUSE Tumbleweed and Debian 11 (bullseye), on which I'm able to
detect the problem (IMHO it would be reproducible on the most of distros) have:
* /var/run is symlink to /run
* use /run/rpcbind.lock (have patch to change /var/run/rpcbind.lock to
  /run/rpcbind.lock [5] [6] @Steve shouldn't be this patch accepted as the default?)

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/include/namespace.h#n12
[2] https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/tree/Makefile#n20
[3] https://man7.org/linux/man-pages/man8/ip-netns.8.html
[4] https://github.com/linux-test-project/ltp/commit/3fb501e04c61fb3d6b6b82011919572a87425cf9
[5] https://build.opensuse.org/package/view_file/network/rpcbind/0001-change-lockingdir-to-run.patch?expand=1
[6] https://salsa.debian.org/debian/rpcbind/-/blob/master/debian/patches/run-migration

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
