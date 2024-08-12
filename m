Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B394EE26
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2024 15:31:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B81A3D2108
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2024 15:31:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 651BC3D0A70
 for <ltp@lists.linux.it>; Mon, 12 Aug 2024 15:31:12 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AEF5F1A00244
 for <ltp@lists.linux.it>; Mon, 12 Aug 2024 15:31:11 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93DF820283;
 Mon, 12 Aug 2024 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723469470;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNa9aNdNEbGZBcz/f1OlDIXuzmlb5DvcgkUkGMyfeQY=;
 b=vLapCMux471miowY4cMeTfdfFlLfoblA3bYiezPMkVIAamMcVGnoI+4A8is8mWLjnEnjLD
 bI6nib7PU7d92Td5VzhcQX0/sBbGwK1NV1ReEVKii5do1WWKGj6iIQgKdqqVoQszlnEifD
 3xcYXzp1iU6B0uMdHFf0yrfcam/xCmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723469470;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNa9aNdNEbGZBcz/f1OlDIXuzmlb5DvcgkUkGMyfeQY=;
 b=nhXM7zMIF4j+55a9cd03Eqq58fMbUoVJdwgHAGcBc0/29muD+9P35DseqdXKejLUO2ATTf
 U+CbKXNnfkRVWEDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vLapCMux;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=nhXM7zMI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723469470;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNa9aNdNEbGZBcz/f1OlDIXuzmlb5DvcgkUkGMyfeQY=;
 b=vLapCMux471miowY4cMeTfdfFlLfoblA3bYiezPMkVIAamMcVGnoI+4A8is8mWLjnEnjLD
 bI6nib7PU7d92Td5VzhcQX0/sBbGwK1NV1ReEVKii5do1WWKGj6iIQgKdqqVoQszlnEifD
 3xcYXzp1iU6B0uMdHFf0yrfcam/xCmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723469470;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNa9aNdNEbGZBcz/f1OlDIXuzmlb5DvcgkUkGMyfeQY=;
 b=nhXM7zMIF4j+55a9cd03Eqq58fMbUoVJdwgHAGcBc0/29muD+9P35DseqdXKejLUO2ATTf
 U+CbKXNnfkRVWEDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38E0E137BA;
 Mon, 12 Aug 2024 13:31:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LFC1C50OumatfAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 12 Aug 2024 13:31:09 +0000
Date: Mon, 12 Aug 2024 15:31:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>, ltp@lists.linux.it,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>
Message-ID: <20240812133103.GA437233@pevik>
References: <9a9b743304c2b6ad1a045f26d33304a3350cdf4c.1723458583.git.jstancek@redhat.com>
 <20240812120221.GA195572@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812120221.GA195572@pevik>
X-Spam-Score: -3.71
X-Rspamd-Queue-Id: 93DF820283
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:dkim,suse.cz:email];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.cz:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+]; MISSING_XM_UA(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/execve04,
 creat07: skip for kernels 6.11 and later
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

Hi Jan,

> Hi Jan,

> > The behaviour is allowed since commit:
> >   2a010c412853 ("fs: don't block i_writecount during exec")
> > that landed in 6.11-rc1.

> Thanks for noticing and fixing this!

> It was reported some time ago:
> https://lore.kernel.org/all/202406141431.2b72ca61-oliver.sang@intel.com/
> https://lore.kernel.org/ltp/202407162117.7730986d-oliver.sang@intel.com/

I have no idea, if you found it yourself, but let's give them the credit:

Reported-by: kernel test robot <oliver.sang@intel.com>

Kind regards,
Petr

> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Kind regards,
> Petr

> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
