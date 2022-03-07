Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFE4CF421
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 09:56:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CC4E3C1BDB
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 09:56:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BE453C1B90
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 09:56:31 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4BB9A600048
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 09:56:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F19C1F37D;
 Mon,  7 Mar 2022 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646643390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTQCj1dpg8HpOYNS/d/gLH1e2uyX1xYYLvD7PILsSic=;
 b=h9QlnAuJlh7ZeatnVV7uboG/XEir9e+9+gLep2RWVqe5Bthn/VGfwV/XIZ/rTBZCWyiLeC
 bGxjvA+xRYQzi87vXjFQXdHz0C+C5XBMVThlTFZqTR1pikWfB0UZLy+LElrgNgH6bKdRnM
 jh4VGuKbfo8czNiHg4Sz5SHa8WTeXjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646643390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTQCj1dpg8HpOYNS/d/gLH1e2uyX1xYYLvD7PILsSic=;
 b=hjGyg4S8puWO2UiE8OnyjMhUR4uMpiHu0DjUW+uELIL6NGplRzNXuYDzWb9orcSH5VZ9mX
 lk9+POgVL13oaqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DA13132D4;
 Mon,  7 Mar 2022 08:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BqYEEr7IJWIkewAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 07 Mar 2022 08:56:30 +0000
Date: Mon, 7 Mar 2022 09:58:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YiXJSYKsDC+SpDcT@yuki>
References: <20220303145032.21493-1-chrubis@suse.cz>
 <20220303145032.21493-6-chrubis@suse.cz>
 <CAEemH2cnCNdUaoWqe=-dyuFq2Zc7gF79yi8XND8ieTvg8iEaRg@mail.gmail.com>
 <YiH/2240VRU1OlAe@yuki>
 <CAEemH2eEJ06UnKJujTjWksutiK2Lmk_HHAwa76nBjAZGpNcVzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eEJ06UnKJujTjWksutiK2Lmk_HHAwa76nBjAZGpNcVzA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] mem/ksm06: Move ksm restoration into the
 tst_test struct
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > But for the two knobs(run, sleep_millisecs) that should exist unless
> > > the kernel disables KSM. So here we'd better start with prefix '!' and
> > > add .needs_kconfg for ???CONFIG_KSM=y' check.
> > > (This also fit for other ksm tests)
> >
> > I guess that if we put ! before the merge_across_nodes that would cause
> > TBROK on systems without CONFIG_NUMA or kernels without that feature.
> >
> > So what about just removing the question marks there and adding
> > .need_kconfigs for KSM and NUMA?
> >
> 
> Er, that's exactly what I meant in the last email, maybe you overlooked
> the last sentence:).
> 
> i.e.
> 
> "
>   prefix ! for 'run' and 'sleep_milisecs'
>   no prefix for 'merge_across_nodes'
>   .need_kconfigs for KSM and NUMA
> "

Ah, right, sorry. What about this:

diff --git a/testcases/kernel/mem/ksm/ksm06.c b/testcases/kernel/mem/ksm/ksm06.c
index 61507b2aa..e734786c1 100644
--- a/testcases/kernel/mem/ksm/ksm06.c
+++ b/testcases/kernel/mem/ksm/ksm06.c
@@ -39,9 +39,6 @@
 #ifdef HAVE_NUMA_V2
 #include <numaif.h>

-static int run = -1;
-static int sleep_millisecs = -1;
-static int merge_across_nodes = -1;
 static unsigned long nr_pages = 100;

 static char *n_opt;
@@ -133,35 +130,11 @@ static void test_ksm(void)

 static void setup(void)
 {
-       if (access(PATH_KSM "merge_across_nodes", F_OK) == -1)
-               tst_brk(TCONF, "no merge_across_nodes sysfs knob");
-
        if (!is_numa(NULL, NH_MEMS, 2))
                tst_brk(TCONF, "The case needs a NUMA system.");

        if (n_opt)
                nr_pages = SAFE_STRTOUL(n_opt, 0, ULONG_MAX);
-
-       /* save the current value */
-       SAFE_FILE_SCANF(PATH_KSM "run", "%d", &run);
-       SAFE_FILE_SCANF(PATH_KSM "merge_across_nodes",
-                       "%d", &merge_across_nodes);
-       SAFE_FILE_SCANF(PATH_KSM "sleep_millisecs",
-                       "%d", &sleep_millisecs);
-}
-
-static void cleanup(void)
-{
-       if (merge_across_nodes != -1) {
-               FILE_PRINTF(PATH_KSM "merge_across_nodes",
-                           "%d", merge_across_nodes);
-       }
-
-       if (sleep_millisecs != -1)
-               FILE_PRINTF(PATH_KSM "sleep_millisecs", "%d", sleep_millisecs);
-
-       if (run != -1)
-               FILE_PRINTF(PATH_KSM "run", "%d", run);
 }
 
 static struct tst_test test = {
@@ -171,11 +144,18 @@ static struct tst_test test = {
                {}
        },
        .setup = setup,
-       .cleanup = cleanup,
        .save_restore = (const char * const[]) {
                "?/sys/kernel/mm/ksm/max_page_sharing",
+               "!/sys/kernel/mm/ksm/run",
+               "!/sys/kernel/mm/ksm/sleep_millisecs",
+               "/sys/kernel/mm/ksm/merge_across_nodes",
                NULL,
        },
+       .needs_kconfigs = (const char *const[]){
+               "CONFIG_KSM=y",
+               "CONFIG_NUMA=y",
+               NULL
+       },
        .test_all = test_ksm,
 };


If we add merge_across_nodes without any prefix we can as well remove
the check for the file existence in the test setup.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
