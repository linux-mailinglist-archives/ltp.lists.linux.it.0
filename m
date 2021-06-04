Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C739B639
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:48:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 725F93C4F3C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:48:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E4A53C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:48:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B92851401205
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:48:55 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A7CD21A11;
 Fri,  4 Jun 2021 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622800135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+YyzFra5QygaGPl9YeWVBpOrxSQzf4R/I/hGfogXNA=;
 b=sYK7U+6OYVU7uZVKgmBCaRhUQjjTDVmn07kfutjsO3ofpyvy6cL63/rkUZ3XsouJdkFKRq
 q/VRjBq2e+wA2oS0GKS6nzUR/LuqTz7MGdYCVOMJoK08OMdelVzBh+oGN1PE2tqhUBTdzd
 uUnV+4GuLS1PwMuDr5IjzDeQkIZrHQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622800135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+YyzFra5QygaGPl9YeWVBpOrxSQzf4R/I/hGfogXNA=;
 b=/cLdB6ymbJyncFRNAfnBlaJHy5WbQ6VrvtBnlmKA71DRjKY35VOvyNpb2B0cmPNjV3Guyc
 pIXXAGnD2uzDDRCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D45A5118DD;
 Fri,  4 Jun 2021 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622800135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+YyzFra5QygaGPl9YeWVBpOrxSQzf4R/I/hGfogXNA=;
 b=sYK7U+6OYVU7uZVKgmBCaRhUQjjTDVmn07kfutjsO3ofpyvy6cL63/rkUZ3XsouJdkFKRq
 q/VRjBq2e+wA2oS0GKS6nzUR/LuqTz7MGdYCVOMJoK08OMdelVzBh+oGN1PE2tqhUBTdzd
 uUnV+4GuLS1PwMuDr5IjzDeQkIZrHQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622800135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+YyzFra5QygaGPl9YeWVBpOrxSQzf4R/I/hGfogXNA=;
 b=/cLdB6ymbJyncFRNAfnBlaJHy5WbQ6VrvtBnlmKA71DRjKY35VOvyNpb2B0cmPNjV3Guyc
 pIXXAGnD2uzDDRCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ItfKMQb3uWAVdQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 09:48:54 +0000
Date: Fri, 4 Jun 2021 11:48:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YLn3BQHhZIq5vNId@pevik>
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
 <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, LTP List <ltp@lists.linux.it>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > > > I suppose it's safe to keep only single licence in testcases/open_posix_testsuite/,
> > > > but could we keep only COPYING in the root directory and delete the rest?
> > > > Or keep COPYING and testcases/open_posix_testsuite/COPYING only?

> > > Do we even need these files? Isn't SPDX identifier enough these days?
> > It be nice we don't need it, but not sure. Looking into kernel tree, there is
> > LICENSES folder [1] and they describe how they use SPDX [2]:

> My perspective is to stay on the safe side, keep one in the LTP root
> dir and one in the subproject(e.g. open_posix).
This makes sense. I'll send RFC patch with your ack.

> The general files go with the SPDX identifier header.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
