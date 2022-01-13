Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 057DF48DAFF
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jan 2022 16:49:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E2613C9523
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jan 2022 16:49:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D3CF33C57AF
 for <ltp@lists.linux.it>; Thu, 13 Jan 2022 16:49:29 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6FCDC600149
 for <ltp@lists.linux.it>; Thu, 13 Jan 2022 16:49:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B1B91F387;
 Thu, 13 Jan 2022 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642088968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPBpX5+3R0gsik+iAC4j7dis7ScEVRCvc4K+YaE1VtE=;
 b=qJLdQwUotW4NUjkpjNj7zbZK4iSAIkEeRLJ4TxlktdfVSn9PQOKCqLLfwOh8F6o7ZehmnB
 m27OKlYHjOOfOcfnWMkKkmiazbRLMG4raHFt/bVsZus2HfwKk+oPoZM7RoqRk1aADNx0t1
 gTLcJsod6sBgoT9/zcvx6XmZVY/4dMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642088968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPBpX5+3R0gsik+iAC4j7dis7ScEVRCvc4K+YaE1VtE=;
 b=Dt9lWHSbWGfwn1Roepwgau8w/KIjQJi5i5QT92Saq9Ez2b8o5lwPXrIiH+Bp9aZTcul8+5
 hVbiLEdxo8kVB1DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85E3D1330C;
 Thu, 13 Jan 2022 15:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yxpUHwhK4GFpIQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 13 Jan 2022 15:49:28 +0000
Date: Thu, 13 Jan 2022 16:51:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YeBKakIm5I4HQECr@yuki>
References: <Ydw4BXF2ramqahuh@yuki>
 <1641881435-2351-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1641881435-2351-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <CAEemH2eZJ7U1+Bdsb5xCB6-KYa1mQQ=GriaDtyFSJ_6zprT7yw@mail.gmail.com>
 <61DD4215.2050104@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61DD4215.2050104@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/5] shell: add kconfig parse api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> int main(int argc, char *argv[])
> {
>          char *str = argv[1];
>          char *delim = argv[2];
>          unsigned int i, cnt = 1;
>          int ret = 0;
> 
>          if (argc == 2) {
>                  delim = ",";
>          } else if (argc == 3) {
>                  if (strlen(delim) > 1) {
>                          fprintf(stderr, "The delim must be a single 
> character\n");
>                          return 1;
>                  }
>          } else {
>                  fprintf(stderr, "Please provide kernel kconfig list and 
> delim "
>                                  "(optinal, default value is ',')\n");
>                  return 1;
>          }

We can make the code a bit easier to read with a switch()

	switch (argc) {
	case 2:
		delim = ",";
	break;
	case 3:
		if (strlen(delim) > 1) {
			fprintf(stderr, "...");
			return 1;
		}
	break;
	default:
		fprintf(stderr, "...");
		return 1;
	}


>          for (i = 0; str[i]; i++) {
>                  if (str[i] == delim[0])
>                          cnt++;
>          }
> 
>          char **kconfigs = malloc(++cnt * sizeof(char *));

It's unlikely that this will fail the allocation, but for the sake of
correctness we should also do:

	if (!kconfigs) {
		fprintf(stderr, "malloc failed");
		return 1;
	}

>          for (i = 0; i < cnt; i++)
>                  kconfigs[i] = strtok_r(str, delim, &str);
> 
>          if (tst_kconfig_check((const char * const*)kconfigs))
>                  ret = 1;
> 
>          free(kconfigs);
>          return ret;
> }

Other than the two minor issues this version looks good to me:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
