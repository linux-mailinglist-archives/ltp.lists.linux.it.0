Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E01627963
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 10:48:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43F6D3CD223
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 10:48:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D2AA3C28F3
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 10:48:06 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D92541A007F2
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 10:48:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9B7C1FDC6;
 Mon, 14 Nov 2022 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668419284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGyi0PCtgqjmuRuMqIRYTYtds468EI1B5CZYSkXnUcg=;
 b=idN40vBZ+nO2H9yJqRqq/iWdCJQlDtSvU47cZ1rvPiW5aDruDmGwexwAdihzulSXSI5iFu
 0UHTchDVYO6GzSjZym4BVKPclWLBUAJNl85pZeIv+FsVbsYfyNIslfk3sRlK5r0Yyi1m2o
 1BZ7IWCI5HdnRyHOKOG9HBwumqf/1OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668419284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGyi0PCtgqjmuRuMqIRYTYtds468EI1B5CZYSkXnUcg=;
 b=ApgtB0uVxnth5q1uCgO6prrAwRIvAz7eSsEJFPYCng310GGKQ0BCIBm3wwfKq3GSM92CSr
 VAJ70vupmRnyxLCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A58EC13A92;
 Mon, 14 Nov 2022 09:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nvWgJtQOcmPrRwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 14 Nov 2022 09:48:04 +0000
Date: Mon, 14 Nov 2022 10:49:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Tarun Sahu <tsahu@linux.ibm.com>
Message-ID: <Y3IPKK4/RYc4DqF6@yuki>
References: <20221108195207.232115-1-tsahu@linux.ibm.com>
 <20221108195207.232115-2-tsahu@linux.ibm.com>
 <Y2unWTTyFK8DS82w@yuki> <20221109212637.haxocrluexxhvktg@tarunpc>
 <Y2y0VzfJwFr0wiwC@yuki> <20221113184438.tmcepansvefom5bk@tarunpc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221113184438.tmcepansvefom5bk@tarunpc>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/5] Hugetlb: Migrating libhugetlbfs counters
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com, geetika@linux.ibm.com,
 vaibhav@linux.ibm.com, ltp@lists.linux.it, mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I guess that we can also put the map() (touch()) test_counters() unamp()
> > sequence to a do_test() fuction then call it from the for() loop in
> > run_test(). That would make the code a bit cleaner.
> > 
> Instead, I am thinking of a defining a macro like this, 
> 
> #define CHECK_(fun) ({			\
> 		if (fun) {					\
> 				break;				\
> 			}						\
> 		})
> 
> inside test_counters:
> 
> do {
> 	CHECK_(map(...));
> 	CHECK_(touch(...));
> 	CHECK_(unmap(...));
> } while(0)
> 
> inside for loop of run_test:
> 
> CHECK_(map(...));
> CHECK_(test_counters(...));
> CHECK_(unmap(...));

While this is much better than longjmp() it still obscures the codeflow
a little bit.

Also I do not think that we need all the braces in the CHECK() macro, it
should be enough just to do:

#define CHECK(fun) \
	if (fun) \
		break;

or even:

#define CHECK(fun) if (fun) break;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
