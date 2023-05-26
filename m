Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8671280A
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BFE03CE791
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:10:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 533303C995F
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:10:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A323D1A00707
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:10:04 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB3871FD76;
 Fri, 26 May 2023 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685110203;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5ojq0zU3dcieCbAgOobXLDdHkocfAqVHkYh6C33euk=;
 b=yjVN4FCTAHKAnmVkd4ryAPDbmreQQykxts65OQHnKslhQVzCFb2sPMxQsAOukVDjewS28E
 7w0OHfvKBQ8Rarxn/qiatYUn4MhywgobQz3+p6w90KHdCmMR33C7j5fUNh9CLdWZ25Rks6
 hZbSbghj+UOgXeHUUCzfs6+TxixgVeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685110203;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5ojq0zU3dcieCbAgOobXLDdHkocfAqVHkYh6C33euk=;
 b=KZF4rMa8j1IO1mLxtyRZ3qqnlkmfFAVNC7DpojKzEIQ63VnC5eBAgMiis5IPM50lK7zLyY
 CkEN+MKR43a8C7Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 79D46134AB;
 Fri, 26 May 2023 14:10:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id hz83G7u9cGRodAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 26 May 2023 14:10:03 +0000
Date: Fri, 26 May 2023 16:10:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it,
 Nicolai Stange <nstange@suse.de>
Message-ID: <20230526141001.GA810612@pevik>
References: <20230526133435.7369-1-mdoucha@suse.cz>
 <20230526133435.7369-3-mdoucha@suse.cz>
 <20230526140759.GA805411@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526140759.GA805411@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/7] Add test for CVE 2021-3656
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

Hi Martin,

FYI used toolchain [1]:

clang version 7.0.1-8+deb10u2 (tags/RELEASE_701/final)
Target: x86_64-pc-linux-gnu

Kind regards,
Petr

[1] https://github.com/pevik/ltp/actions/runs/5091551272/jobs/9151721119

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
