Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB4442C63
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 12:20:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FBF13C7130
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 12:20:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9242C3C68BB
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 12:20:34 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0DCA1600C43
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 12:20:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 194D5212C0;
 Tue,  2 Nov 2021 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635852033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LHPkVOzSXJSzjxj6UeGXi5DvTi2UNJC0dTDEqDW/JtM=;
 b=YeKsFsq4jBF40Tbt2SDxUd4+lpR2x2++j7JLrGjZs0RyMIm/k6kPmnaY9JOY9W8OIBG1mU
 Zl9uPhB0MU1bvuClCBcIbI6lic5FlTnev9TLoumCj/dZsO483y6X8xAbvEhe0lRSVR6QGo
 zIhUlYXkev8sbXUJ426g1o/WCJk9sOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635852033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LHPkVOzSXJSzjxj6UeGXi5DvTi2UNJC0dTDEqDW/JtM=;
 b=DOwHOEQ2Q47Vaq7erdZ43OtqPtJdsFEItrrd+nIowJw0N4ok5dNElSqalZ7gMR82+03epf
 EfRJH3gDjXxq+eDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 018BE13C1F;
 Tue,  2 Nov 2021 11:20:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IMyFOgAfgWE8QwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 02 Nov 2021 11:20:32 +0000
Date: Tue, 2 Nov 2021 12:21:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YYEfNvjosOzWzKRJ@yuki>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-2-chrubis@suse.cz> <871r3yq0hm.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871r3yq0hm.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] docparse: Implement #define and #include
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
> > +static void macro_get_string(FILE *f, char *buf, char *buf_end)
> > +{
> > +	int c;
> > +
> > +	for (;;) {
> > +		c = fgetc(f);
> > +
> > +		switch (c) {
> > +		case '"':
> 
> Luckily there are no instances of '#define MACRO "...\"...\"..."' in LTP
> AFAICT. Also there don't appear to be any '#define MACRO "..." \\n' that
> we would care about.

Well I can fix that and add a test to to be sure.

> > +		case EOF:
> > +			*buf = 0;
> > +			return;
> > +		default:
> > +			if (buf < buf_end)
> > +				*(buf++) = c;
> > +		}
> > +	}
> > +}
> > +
> > +static void macro_get_val(FILE *f, char *buf, size_t buf_len)
> > +{
> > +	int c, prev = 0;
> > +	char *buf_end = buf + buf_len - 1;
> > +
> > +	c = fgetc(f);
> > +	if (c == '"') {
> 
> I guess this could be whitespace unless scanf slurps any trailing
> whitespace?

The scanf does not slurp any trainling whitespaces, so this should be
fixed by:

	while (isspace(c = fgetc(f)));

With that we get slightly better output, so I will add that before
applying.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
