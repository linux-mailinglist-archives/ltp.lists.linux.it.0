Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C645FB0EF5E
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jul 2025 12:09:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76C6A3CCD66
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jul 2025 12:09:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A7BC3CAD64
 for <ltp@lists.linux.it>; Wed, 23 Jul 2025 12:09:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 735301A0088E
 for <ltp@lists.linux.it>; Wed, 23 Jul 2025 12:09:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5650D218A8;
 Wed, 23 Jul 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753265368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HmRWZKe2xJYKTtH2Uq8RuEsl6zNVmU6PQPkBYfkvKq0=;
 b=wn61R9wbdDqGEiTr6BKvHl1c00fxXOCftAxIraLzkrCg5r3F/qldUFuY9zHV60EqfrqRhB
 ihyem+jRp3ewUnzHXLF2u8lqm0NHS/mYg2zyoZ/bxqfkq8sKCXxFFAbj7B2ab9NwSjsPiG
 qZ9BRFL8v3eSlyudQLUgIywnOkCRxk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753265368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HmRWZKe2xJYKTtH2Uq8RuEsl6zNVmU6PQPkBYfkvKq0=;
 b=o/1V1g5C6W6Q1XmuguGOACn+krPbGjZlLw3m/QUdf3VQ/5r0JNzXMsVSTP0ysJmGpqB1OQ
 XH9Lt27oxZf13vCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753265367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HmRWZKe2xJYKTtH2Uq8RuEsl6zNVmU6PQPkBYfkvKq0=;
 b=s/Ecq5uUdhDRW1BqBEucMaPdY9WopnzBoHzELTsAOVWCZinSlT18c/rTRpbOPbElIxyDb5
 3KCtZf65aJM7GCPBC1D7TFMMmFv9mspQN94+4m3j/eA/1HJeUlPZcqA35cJlWyVWgop5M8
 FkQuloZqm1IdE5U3oHYmtJ1v/9f3vbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753265367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HmRWZKe2xJYKTtH2Uq8RuEsl6zNVmU6PQPkBYfkvKq0=;
 b=kctxIaAvDNhK34z+R2BzuUCSKo5P6bEV7rrASg+wlElDbv97IDsUv3MlIRP38y64vhg4gd
 H5QeconLfGSaSZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 434C313ABE;
 Wed, 23 Jul 2025 10:09:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ks0pENe0gGgbYwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jul 2025 10:09:27 +0000
Date: Wed, 23 Jul 2025 12:10:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aIC1A9yNXKX6QN2N@yuki.lan>
References: <20250722125916.74967-1-pvorel@suse.cz>
 <20250722125916.74967-5-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722125916.74967-5-pvorel@suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 4/6] tst_res_: Print error to stderr,
 with filename and lineno
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Printing to stderr, tst_res_ filename and lineno helps debugging wrong
> code. Best would be if it prints either code which invoked it or the
> original message, but at least this is an improvement.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> * New in v4
> 
>  testcases/lib/tst_res_.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/lib/tst_res_.c b/testcases/lib/tst_res_.c
> index c09d689ee5..5b255d4d54 100644
> --- a/testcases/lib/tst_res_.c
> +++ b/testcases/lib/tst_res_.c
> @@ -16,7 +16,7 @@ int main(int argc, char *argv[])
>  	int type, i;
>  
>  	if (argc < 5) {
> -		printf("argc = %i expected 5\n", argc);
> +		fprintf(stderr, "%s:%d: argc = %i expected 5\n", __FILE__, __LINE__, argc);
>  		goto help;
>  	}
>  
> @@ -35,7 +35,7 @@ int main(int argc, char *argv[])
>  	} else if (!strcmp(argv[3], "TBROK")) {
>  		type = TBROK;
>  	} else {
> -		printf("Wrong type '%s'\n", argv[3]);
> +		fprintf(stderr, "%s:%d: Wrong type '%s'\n", __FILE__, __LINE__, argv[3]);

In this case we cantually have file and line in argv[1] and argv[2] and
we can print that as well.

And possibly in the case that argc < 5 we can attempt to print argv[1]
and argv[2] as well, but it's likely going to be wrong data since the
number of arguments does not match in that case.

>  		goto help;
>  	}
>  
> -- 
> 2.50.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
