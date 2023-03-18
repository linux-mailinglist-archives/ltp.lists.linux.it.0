Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD56BF7E1
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Mar 2023 06:00:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BA7D3CD418
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Mar 2023 06:00:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 916CA3CB02B
 for <ltp@lists.linux.it>; Sat, 18 Mar 2023 06:00:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E8C87140121F
 for <ltp@lists.linux.it>; Sat, 18 Mar 2023 06:00:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D27BA21ABF;
 Sat, 18 Mar 2023 05:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1679115645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7JeO2d0bmowqxtuX6oWLIc/oeG5E0S1jXG2eyabeoM=;
 b=vMtf7R8LETPXUhYepJkVHreQ1h8sCXk/0zb4OHEWzEbnafP2uMOqSffrgZcwo4ySIFKUx/
 RckgprMLTnGXztEy4kcMxlt/zsx/WV9PaJeHMJmJaetM8DSDTkr7MDOswSbVU7ZFFF8G1e
 qPm30cTO8FR8g74OKM6ACC9+33jt4Yg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 896541391B;
 Sat, 18 Mar 2023 05:00:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VObCFnxFFWTYdgAAMHmgww
 (envelope-from <wegao@suse.com>); Sat, 18 Mar 2023 05:00:44 +0000
Date: Sat, 18 Mar 2023 01:00:41 -0400
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230318050041.GA11900@localhost>
References: <20230306235715.29868-1-wegao@suse.com>
 <20230307085139.3574-1-wegao@suse.com> <87ttyo6g7o.fsf@suse.de>
 <20230315125532.GB10248@localhost> <87jzzg3oqg.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzzg3oqg.fsf@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] kill01: New case cgroup kill
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Mar 16, 2023 at 11:10:07AM +0000, Richard Palethorpe wrote:
> 
> Wei Gao <wegao@suse.com> writes:
> 
> >> > +static int cg_run_nowait(const struct tst_cg_group *const cg,
> >> > +		  void (*fn)(void))
> >> 
> >> Why keep this function?
> >> 
> >> If you want to convert tests to LTP, then don't do the minimum possible
> >> to use the LTP API. Use as much of it as possible otherwise we are just
> >> importing brittle self tests.
> >> 
> > function is useful and wrap the fork action & put pid into cgroup.procs,
> > is there any LTP API can replace this function? Could you help give
> > example.
> 
> IMO you don't need to wrap fork or SAFE_CG_PRINTF, just write it inline.
More logic added into this function in latest patch v6, i prefer keep it currently.
> 
> >> > +
> >> > +	for (i = 0; i < pid_num; i++)
> >> > +		pids[i] = cg_run_nowait(cg_child_test_simple, child_fn);
> >> 
> >> If the parent is killed and the children are moved then they will return
> >> and cause a fork bomb.
> > There is no extra fork action in child_fn so all child_fn will
> > reparent and exit.
> 
> I don't see how it will exit? It seems like it will just return.

The child_fun will exit if parent id is changed like below

+static void child_fn(void)
+{
+	int ppid = getppid();
+
+	while (getppid() == ppid)
+		usleep(1000);
+
+}


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
