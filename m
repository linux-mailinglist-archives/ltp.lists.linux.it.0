Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DC3B0A1D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:17:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2A53C96DE
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:17:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E7B543C7015
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:17:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 18DCE6009CE
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:17:37 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 764F51FD36;
 Tue, 22 Jun 2021 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624378657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcmysdJt/6bVpwnWlquZOZgmdhGXrM/H1OpQyCQa8jw=;
 b=iopXz1dNgb3avZXcjPqfNSoEVzm0eJugmlCY/RscvIWRDwtrr79hsgzhBKq68Vz4KxeOog
 iOEBKDD1zQtQ2XQyKZKe4eoENAErIDYK0Xu9p1yVfzP4naplKpbvzdBmVCkFJH7fJhrZjh
 lj5Qz/lmvyVQnXfDVdP2PRtHrJLGs7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624378657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcmysdJt/6bVpwnWlquZOZgmdhGXrM/H1OpQyCQa8jw=;
 b=RJLue5rU7AxdVegPSHc+P28tieZbg/B5zMiK59N13Exp7QgqycjJ9DNWdJj/PfwmVPBKnQ
 Tvthw6qXyqrcbpBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 55A2B11A97;
 Tue, 22 Jun 2021 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624378657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcmysdJt/6bVpwnWlquZOZgmdhGXrM/H1OpQyCQa8jw=;
 b=iopXz1dNgb3avZXcjPqfNSoEVzm0eJugmlCY/RscvIWRDwtrr79hsgzhBKq68Vz4KxeOog
 iOEBKDD1zQtQ2XQyKZKe4eoENAErIDYK0Xu9p1yVfzP4naplKpbvzdBmVCkFJH7fJhrZjh
 lj5Qz/lmvyVQnXfDVdP2PRtHrJLGs7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624378657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcmysdJt/6bVpwnWlquZOZgmdhGXrM/H1OpQyCQa8jw=;
 b=RJLue5rU7AxdVegPSHc+P28tieZbg/B5zMiK59N13Exp7QgqycjJ9DNWdJj/PfwmVPBKnQ
 Tvthw6qXyqrcbpBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YpaGEyEN0mCXIgAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Tue, 22 Jun 2021 16:17:37 +0000
To: rpalethorpe@suse.de
References: <20210622154804.19946-1-mdoucha@suse.cz> <871r8t6frr.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <912a58e4-3c05-4de0-6346-7cfa80f6fbd4@suse.cz>
Date: Tue, 22 Jun 2021 18:17:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <871r8t6frr.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_rtnetlink: pass error codes using rtnl_errno
 variable
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

On 22. 06. 21 18:11, Richard Palethorpe wrote:
> Hello Martin,
> 
> Martin Doucha <mdoucha@suse.cz> writes:
>> +extern int rtnl_errno;
> 
> This is polluting the name space. I suppose it can be prepended
> with tst_, but does the test author need to see this? Or you could even
> just merge tst_netdevice and tst_rtnetlink.
> 
> Otherwise I think this approach is fine.

You're right, I should have prefixed it with tst_. I'll send v2 in a moment.

Yes, test authors will need to access this variable if they want to use
RTNL_CHECK_ACKS() or RTNL_SEND_VALIDATE() in their tests.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
