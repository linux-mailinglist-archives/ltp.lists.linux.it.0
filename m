Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2173FAF1
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jun 2023 13:20:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B20D3CC38C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jun 2023 13:20:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EDEA3C99A6
 for <ltp@lists.linux.it>; Tue, 27 Jun 2023 13:20:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2ED0420007A
 for <ltp@lists.linux.it>; Tue, 27 Jun 2023 13:20:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 546F11F8CD;
 Tue, 27 Jun 2023 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687864803;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dJ5TDkBdGRSZjwiIj7ytzZ7dO3eUxKaY50XVtWD+0OE=;
 b=Jkav9XxcHrp+vjwmTNzfDiQ3jWRVyrC3HQIAUT5y5Br/krNt5kWJL6ogVxbvidWWwbBhJR
 CEo9H3PgJW6lJOHWlJJlzFPNBqGurW2sX7YI7MmUtMZ2nIho0r0hwma6hNJhqqSzWlvsFB
 P5n8V98xZtQ+8NfRoNqT6aNuV9nohME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687864803;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dJ5TDkBdGRSZjwiIj7ytzZ7dO3eUxKaY50XVtWD+0OE=;
 b=DwksnJA3WS0IuMhSpofeV6ny2jObLMe5IiEGEkogJFg8R9I+SdAgRK9G++Ll0IxQUNpu8g
 SF9SnxbqaVd9OmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BC8113276;
 Tue, 27 Jun 2023 11:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HoqyOuLFmmSqHwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jun 2023 11:20:02 +0000
Date: Tue, 27 Jun 2023 13:20:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ashwin Dayanand Kamat <kashwindayan@vmware.com>, ltp@lists.linux.it,
 akaher@vmware.com, tkundu@vmware.com, vsirnapalli@vmware.com,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230627112001.GC24533@pevik>
References: <1687445437-2453-1-git-send-email-kashwindayan@vmware.com>
 <20230627110931.GB24533@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230627110931.GB24533@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] sctp_big_chunk: Do not use md5 hmac algo if
 fips is enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi,

> > MD5 is not FIPS compliant. But still md5 is used as the default algorithm for sctp
> > even when fips is enabled. Due to this, sctp_big_chunk testcase is failing because listen()
> > system call in setup_server() is failing in fips environment.

> > Fix is to not use md5 algorithm while setting up server, instead set it to none

> > Signed-Off by: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
> > ----
> > v2:
> > As per the review comments given by Petr, did below changes in v2,
> >         * Moved the logic to sctp_server() function
> >         * Setting none as the default algo
> >         * make sure cookie_hmac_alg file is present before accessing it
> BTW I suggested modprobe, because I'm not aware of other way to trigger it.
> But maybe creating SCTP socket would trigger it, e.g.
> socket(PF_INET, SOCK_STREAM, IPPROTO_SCTP);

Yes, this simple socket call loads sctp module. Could we use something like
this:

	int fd;

	fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, IPPROTO_SCTP);
	SAFE_CLOSE(fd);

to make sure sctp is loaded instead of directly calling modprobe?

I'm sorry I didn't find this before.

Kind regards,
Petr

> If yes, IMHO it'd be more elegant solution and (likely) we would not depend on
> modprobe.

> Kind regards,
> Petr

> > ---
> >  testcases/network/sctp/sctp_big_chunk.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)

> > diff --git a/testcases/network/sctp/sctp_big_chunk.c b/testcases/network/sctp/sctp_big_chunk.c
> > index a6a326ea2..31786dd39 100644
> > --- a/testcases/network/sctp/sctp_big_chunk.c
> > +++ b/testcases/network/sctp/sctp_big_chunk.c
> > @@ -34,6 +34,24 @@ static int addr_num = 3273;

> >  static void setup_server(void)
> >  {
> > +	const char *const cmd_modprobe[] = {"modprobe", "sctp", NULL};
> > +	const char hmac_algo_path[] = "/proc/sys/net/sctp/cookie_hmac_alg";
> > +	char hmac_algo[CHAR_MAX];
> > +	int hmac_algo_changed = 0;
> > +
> > +	/* Disable md5 if fips is enabled. Set it to none */
> > +	if (tst_fips_enabled()) {
> > +		if (access(hmac_algo_path, F_OK) < 0) {
> > +			SAFE_CMD(cmd_modprobe, NULL, NULL);
> > +		}
> > +
> > +		if (!access(hmac_algo_path, F_OK)) {
> > +			SAFE_FILE_SCANF(hmac_algo_path, "%s", hmac_algo);
> > +			SAFE_FILE_PRINTF(hmac_algo_path, "%s", "none");
> > +			hmac_algo_changed = 1;
> > +		}
> > +	}
> > +
> >  	loc.sin6_family = AF_INET6;
> >  	loc.sin6_addr = in6addr_loopback;

> > @@ -46,6 +64,9 @@ static void setup_server(void)
> >  	SAFE_LISTEN(sfd, 1);

> >  	srand(port);
> > +
> > +	if (hmac_algo_changed)
> > +		SAFE_FILE_PRINTF(hmac_algo_path, "%s", hmac_algo);
> >  }

> >  static void update_packet_field(size_t *off, void *buf, size_t buf_len)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
