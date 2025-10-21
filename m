Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B5BF47A5
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Oct 2025 05:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1761016670; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=QVr8y1cwUyLONpBeOyvJO75XCi0Y+IGGulqFmsIlgUM=;
 b=cKObQd3CeLQjL42jq+6+E/gQnuQsjkEDLYcTAM1mheoHwLwdFpC5/eTUVCx/myZRBHf+X
 gFqzwSmi7AIuV+HoBXmMEk/YdyWQMbz0bnciAMOH6gnbbeJN4kEWbMujzgql21eDrbQUYVu
 8RMDTHfZoXrEwUEATwmUSNudl5VISJo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B16F3CEFD8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Oct 2025 05:17:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A6DB3CE92A
 for <ltp@lists.linux.it>; Tue, 21 Oct 2025 05:17:37 +0200 (CEST)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66DBD1A000B3
 for <ltp@lists.linux.it>; Tue, 21 Oct 2025 05:17:36 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so27362595e9.2
 for <ltp@lists.linux.it>; Mon, 20 Oct 2025 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761016655; x=1761621455; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pekg52VjoWYEjiz7ybLKhKRm5qRvJHn0a9ix7VJAxkM=;
 b=Xd+LzzqdTsTV1AmvS7UOZfSZOejNPti2ngrzxoigqF6xqRX5W/Yem+Op1InlVMvWWQ
 RwlXpamYfbo6rLrtv7Nv/4hEtEiLw9yDjzs9XF4b1HWgq2X+jThhivExY536YytZ2GVl
 g5aIqWvVxckAxOEvut1+OKqh9x1t76LInTdirPhfqa6hxYtP7RFlmSLKhZB2Of8cHiYz
 dhOwOQEp/BpvSk14AAkWg4U0z+9XBnh8lItymaZZPPzDDlMJ0osQmSXOZFSg5K1D4DsI
 2hR/y7GZzb17b9VIefiC43keiW36My7HzvQipY2y3oDVitiwinuT9jkJv+DK05i4quZf
 Fy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761016655; x=1761621455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pekg52VjoWYEjiz7ybLKhKRm5qRvJHn0a9ix7VJAxkM=;
 b=q8pz80nVs7tG4Fmag8d9OVdefPka0ielg12hKArnGAmzk6jVdiL2KOmt1+M9jOe3Im
 M0apR1mXVxevTznnoR+AErbDCPcR7bL1TaGWUjKPycz8tmcsyHOVd0pKf3YHqBzt1wQ4
 S8rez6KDd5BgEQ5kD15n9pzbbw9axYQ2BcV2ra/Llv8mCk9DYYPQqwotDGgF3IqHKBT5
 VSlR0MeFWrnSAo7YWxA5/5YDmsF0vU8EeWN4EYQlHw7qVTFO2QGMV5qE5g1d/GLVlwxG
 3PQwIXpgc3KvAGUJAXL91kLScnJH3u393Sruu/b5YGCFit4KfcTl2zLP8+XLPCAOzqnr
 AsHw==
X-Gm-Message-State: AOJu0Yz9jP6XzS0YdNbAzWJjY7+WORzlDnzZbgfxKpUIIEXvkFEWJQq0
 WvlOO2WBYJdnSMu1gp2SDI2PPKbEaowf3VBrs7OiOi1+XrBnCS//D5tjc/Ilvj3q5w==
X-Gm-Gg: ASbGnct+qcxlWYDsJFfRBrh49/DDgLCwWBb/yHuaByze0ZAAT3soWASPGQD3yXvmzfD
 WEXMRiSG/+qvDUrwGHJNPt7PW8nXZkjEaf/ECGNULPNsKdC8frnDSSqKnTu+4pzP0iKsi/lpY5W
 6rBjdn/LeYDWgJlg6gdvKOgknS41Uv2Ludcy1LZgXYgYFS1vwMc2eIeD0y3tbdlw43ZQcd9WwOr
 +dUfGpWXoiJjmS4E6/5PB+1Wfprv1MSJjV0x4RYWnSgIU5eU7pI9FQnBMhrWEOf/q7sevijv6YL
 JUUgLp/TinshJRTrc91qFfHfPcGAeVTTOoSLYWQ6LPQp/fTUnC0zY1Tt2cn5N50prvcz6cHnPyn
 H5aW/xphK3bBsJgZlZvvUzdqJWUZreJKGOcOdEcSt9mHyozuIrwB4JGpvrJt+lO8GJqLo+gZ386
 pYXmoQtLOXng==
X-Google-Smtp-Source: AGHT+IFc4xvh+/pR56++Rlp3kkE507pPj8NdeXqOjXhuTHYPWPHMhuVZ+5od0pJjhWPBcJ5xlxKRVw==
X-Received: by 2002:a05:600c:800f:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-471179041b6mr113341205e9.25.1761016655480; 
 Mon, 20 Oct 2025 20:17:35 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f88sm17425218f8f.7.2025.10.20.20.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 20:17:35 -0700 (PDT)
Date: Tue, 21 Oct 2025 03:17:33 +0000
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aPb7Tcr_fbrmz45p@localhost>
References: <20251010064745.31361-1-wegao@suse.com>
 <20251017101011.3811-1-wegao@suse.com>
 <20251017101011.3811-2-wegao@suse.com>
 <20251020133329.GB398576@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020133329.GB398576@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 1/3] lib: Add support option for .needs_cmds
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Oct 20, 2025 at 03:33:29PM +0200, Petr Vorel wrote:
> Hi Wei,
> 
> ...
> > +++ b/lib/tst_cmd.c
> > @@ -265,7 +265,12 @@ int tst_check_cmd(const char *cmd, const int brk_nosupp)
> >  	str = strtok_r(NULL, " ", &next);
> 
> >  	if (tst_get_path(cmd_token, path, sizeof(path)))
> > -		tst_brkm(TCONF, NULL, "Couldn't find '%s' in $PATH", cmd_token);
> > +		if (brk_nosupp) {
> > +			tst_brkm(TCONF, NULL, "Couldn't find '%s' in $PATH", cmd_token);
> > +		} else {
> > +			tst_resm(TCONF, "Couldn't find '%s' in $PATH", cmd_token);
> > +			return 1;
> > +		}
> 
> You ask me how you could split changes to be compilable and yet not in a single
> commit.  This is a completely unrelated change, it should be in a separate
> commit, with:
> 
> Fixes: 257394e4e3 ("Filter mkfs version in tst_fs")
Thanks, will use separte commit next patch.
> 
> Kind regards,
> Petr
> 
> >  	if (!op_token)
> >  		return 0;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
