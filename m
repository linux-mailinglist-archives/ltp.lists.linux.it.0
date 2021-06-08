Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D939F12D
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:43:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07D783C4DA4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:43:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D0C83C1D75
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:43:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87BC96012DD
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:43:19 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A24E71FD2A;
 Tue,  8 Jun 2021 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623141797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9fmcMc+cBSrhCDILq5MAmLyDYIUHMn4FhKEWvtdoeek=;
 b=xSfX5uDNClJtRaSEQAa1sIz66J+CE8EhnjHvYws6WwAFo10CJ1kdm7OkH7JB6c5/z3HOiP
 rPnKHWX6RX11VXtHCO/WUgnCT3EkC7Esaht/Mi3QnYlVlvuVrpUW5HWqAFP5aqUFmW68Z/
 tIBmycWAbONlceJpwSTNX9fm+MI85Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623141797;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9fmcMc+cBSrhCDILq5MAmLyDYIUHMn4FhKEWvtdoeek=;
 b=cYRSgz0aosKtGJrkwi3K9SQ6xgbjsjzXQr8xB6UO3Og8BkNnxfprtDeHQ7aAJiUWxk/4ni
 gWdZ3hgrWGxm/ZDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8D64F118DD;
 Tue,  8 Jun 2021 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623141797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9fmcMc+cBSrhCDILq5MAmLyDYIUHMn4FhKEWvtdoeek=;
 b=xSfX5uDNClJtRaSEQAa1sIz66J+CE8EhnjHvYws6WwAFo10CJ1kdm7OkH7JB6c5/z3HOiP
 rPnKHWX6RX11VXtHCO/WUgnCT3EkC7Esaht/Mi3QnYlVlvuVrpUW5HWqAFP5aqUFmW68Z/
 tIBmycWAbONlceJpwSTNX9fm+MI85Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623141797;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9fmcMc+cBSrhCDILq5MAmLyDYIUHMn4FhKEWvtdoeek=;
 b=cYRSgz0aosKtGJrkwi3K9SQ6xgbjsjzXQr8xB6UO3Og8BkNnxfprtDeHQ7aAJiUWxk/4ni
 gWdZ3hgrWGxm/ZDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id HAgfIaUtv2AGRAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 08 Jun 2021 08:43:17 +0000
Date: Tue, 8 Jun 2021 10:17:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YL8nl3nFzTAy+aG0@yuki>
References: <20210607111016.20630-1-pvorel@suse.cz>
 <CAASaF6x1+j+nF=-TpkfLwi9hYXWN5sDVff4oJAKX-eTyH11s8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6x1+j+nF=-TpkfLwi9hYXWN5sDVff4oJAKX-eTyH11s8A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Remove floppy and CDROM stress tests
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
Cc: Zeng Linggang <zenglg.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Yixin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Acked by me as well, but let's wait at least till the end of week until
we apply this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
