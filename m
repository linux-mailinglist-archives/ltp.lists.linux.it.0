Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E83A23D56
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2025 12:51:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 824BE3C7AFE
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2025 12:51:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75A293C6609
 for <ltp@lists.linux.it>; Fri, 31 Jan 2025 12:51:05 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D7A4563B714
 for <ltp@lists.linux.it>; Fri, 31 Jan 2025 12:51:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C5C51F38D;
 Fri, 31 Jan 2025 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738324263;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzk0oXlVAiSgZaXN4KAk7S38uoIUZld15I0LodQt26Y=;
 b=RdxYcEU/DYWrMJyDDef6pGJiD+Fm9Ynl1jP5Awlk8elWyeBgMEvN0nTfOK7bG7gxcK+2wD
 fUTzZthsorlOCLZYvCQq7AtmBAdK9ihj9VOOX7OkHjIecDlzFzQGieaNo17u3nzdGTP1JE
 PSw+RE2JP0xYizLjnpOaL9IzGgeDOb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738324263;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzk0oXlVAiSgZaXN4KAk7S38uoIUZld15I0LodQt26Y=;
 b=HQns3gUFJIKQx1Lo3LzJlGnzyxMEAfumCP/QtdGeGuyg6LrV2vZTZjI+v5sSNDwdQILn6L
 NPO328F0BD1MZnBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1738324263;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzk0oXlVAiSgZaXN4KAk7S38uoIUZld15I0LodQt26Y=;
 b=RdxYcEU/DYWrMJyDDef6pGJiD+Fm9Ynl1jP5Awlk8elWyeBgMEvN0nTfOK7bG7gxcK+2wD
 fUTzZthsorlOCLZYvCQq7AtmBAdK9ihj9VOOX7OkHjIecDlzFzQGieaNo17u3nzdGTP1JE
 PSw+RE2JP0xYizLjnpOaL9IzGgeDOb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1738324263;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzk0oXlVAiSgZaXN4KAk7S38uoIUZld15I0LodQt26Y=;
 b=HQns3gUFJIKQx1Lo3LzJlGnzyxMEAfumCP/QtdGeGuyg6LrV2vZTZjI+v5sSNDwdQILn6L
 NPO328F0BD1MZnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D610E133A6;
 Fri, 31 Jan 2025 11:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4jymMSa5nGcFSAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 31 Jan 2025 11:51:02 +0000
Date: Fri, 31 Jan 2025 12:50:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250131115046.GA1116925@pevik>
References: <20250131091535.GB1090737@pevik>
 <Z5y03QTwjlgsuJ88@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5y03QTwjlgsuJ88@yuki.lan>
X-Spam-Score: -7.50
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC] Remove [Description] subtitle from docparse
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

> Hi!
> > Can we remove [Description] part from docparse documentation in tests?
> > This is transformed into "Description" subtitle in resulted html/pdf.

> > 1) It's not really needed (it's obvious that it's a description of the test)
> > 2) Sometimes it's missing (inconsistency).

> That part can be fixed with something as:

> diff --git a/metadata/metaparse.c b/metadata/metaparse.c
> index 2b96149dc..422604a2c 100644
> --- a/metadata/metaparse.c
> +++ b/metadata/metaparse.c
> @@ -852,6 +852,14 @@ static struct data_node *parse_file(const char *fname)

>         if (data_node_array_len(doc)) {
>                 data_node_hash_add(res, "doc", doc);
> +
> +               char *str = doc->array.array[0]->string.val;
> +
> +               if (!strstr("[Description]", str)) {
> +                       fprintf(stderr, "%s: Missing [Description] in doc comment!\n", fname);
> +                       exit(1);
> +               }
> +
>                 found = 1;
>         } else {
>                 data_node_free(doc);

Sure, that could work as well.

> > I would keep other subtitles (e.g. [Algorithm]), just remove the first one.

> I find it a bit inconsistent if we do it this way, but I guess either
> way is fine.

The reason why suggested to remove it is that I don't see much information value
in "Description" title. "Algorithm" has at least little bit of information value.

Besides these two we have only:
* [Prerequisites] (testcases/kernel/mem/ksm/ksm07.c)
* [Race Description] (testcases/kernel/syscalls/fork/fork13.c)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
