Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 912777C8598
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 14:22:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFA203CEE4A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 14:22:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D4063CD3BE
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 14:22:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0AFB71000ED2
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 14:22:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FE6B1FD9A;
 Fri, 13 Oct 2023 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697199737;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tf5VhTiB6Ehha0jX1mo+MMY6uewsN/pUer1Qwg+RFXE=;
 b=Qa2BGWwfP3meHeuTpuhT7BvT0s/MsHO34idKSdHEUTK755P4ZKeE8Ou2PJyXm8fv5jpaes
 lbczooaA4D71lN8waZG/LMz9UOd5+Z3+t8vuEHXRMLe+GU3x10ZsNbLX/DRYNkL3DczZwM
 TD20fR8bkNzPATe/+xLvOGVLcUKAQJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697199737;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tf5VhTiB6Ehha0jX1mo+MMY6uewsN/pUer1Qwg+RFXE=;
 b=VYb+KpR1UDuOutxE2BpUiGqnnK8CQFUvOJk2OyVQeeXxJ7r/41FkXFqutcJfN8SlTrYwal
 WdQ1/juvocnp8rBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E660D1358F;
 Fri, 13 Oct 2023 12:22:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g4T7Nng2KWWnbgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 13 Oct 2023 12:22:16 +0000
Date: Fri, 13 Oct 2023 14:22:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20231013122215.GA733568@pevik>
References: <20231013074748.702214-1-pvorel@suse.cz>
 <20231013074748.702214-3-pvorel@suse.cz>
 <CAEemH2fQuqPhd+5wjiBeswJQOG=FikpKmL6eubdWgyWqehX6fw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fQuqPhd+5wjiBeswJQOG=FikpKmL6eubdWgyWqehX6fw@mail.gmail.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.30
X-Spamd-Result: default: False [-7.30 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; REPLY(-4.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[31.23%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] lib: Add .modprobe
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

Hi Li,

> > +/*
> > + * Search kernel driver in /proc/modules.
> > + *
> > + * @param driver The name of the driver.
> > + * @return 1 if driver is found, otherwise 0.
> > + */
> > +static int module_loaded(const char *driver)



> What about renaming it as tst_module_is_loaded() and move into tst_kernel.h?
> I guess we could make use of it widely for checking module loading or not.

+1

Note, it's based on find_in_file() from madvise11.c (which I then removed in the
3rd commit). This function takes 2 params (also file), maybe we can have use for
this generic function. It's kind of similar to safe_file_scanf().

Kind regards,
Petr

> > +{
> > +       char line[4096];
> > +       int found = 0;
> > +       FILE *file = SAFE_FOPEN("/proc/modules", "r");
> > +
> > +       while (fgets(line, sizeof(line), file)) {
> > +               if (strstr(line, driver)) {
> > +                       found = 1;
> > +                       break;
> > +               }
> > +       }
> > +       SAFE_FCLOSE(file);
> > +
> > +       return found;
> > +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
