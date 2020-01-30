Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436114D865
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 10:51:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 195C93C23B2
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 10:51:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 20DCD3C22C8
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 10:51:11 +0100 (CET)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9E64110019DA
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 10:51:08 +0100 (CET)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 01:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,381,1574150400"; d="scan'208";a="428315672"
Received: from xpf-desktop.sh.intel.com (HELO xpf-desktop) ([10.239.13.107])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2020 01:51:04 -0800
Date: Thu, 30 Jan 2020 18:00:17 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200130100017.24cycwmkcynqta2w@xpf-desktop>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20200129161957.GF22477@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129161957.GF22477@rei.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/4] lib/tst_kconfig.c: add any kconfig with or
 without expected value function
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,
  Thanks for advice!
  I only support the CONFIG_A|CONFIG_B=X function, and there is only 1 '='
  contained in 1 line kconfig check.
  Could we add the function first, only support CONFIG_A|CONFIG_B=X function?

  Next to consider the function for CONFIG_A=X|CONFIG_B=Y.
  And I tried to add the function you mentioned in tst_kconfig.c,
  found CONFIG_A=X|CONFIG_B=Y, if kconfig set as CONFIG_A=Y, it will meet
  judge correctly issue, there is no kconfig item string in tst_kconfig_res.
struct tst_kconfig_res {
	char match;  // match char like y|m|v
	char *value; // *value like 4|44
};

  Or shall we need change the kconfig verify way?

  Thanks!
  BR.

On 2020-01-29 at 17:19:57 +0100, Cyril Hrubis wrote:
> Hi!
> >  	for (i = 0; i < cnt; i++) {
> >  		const char *val = strchr(kconfigs[i], '=');
> > @@ -176,12 +177,9 @@ void tst_kconfig_read(const char *const *kconfigs,
> >  			tst_brk(TBROK, "Invalid config string '%s'", kconfigs[i]);
> >  
> >  		matches[i].match = 0;
> > -		matches[i].len = strlen(kconfigs[i]);
> >  
> > -		if (val) {
> > +		if (val)
> >  			matches[i].val = val + 1;
> > -			matches[i].len -= strlen(val);
> > -		}
> >  
> >  		results[i].match = 0;
> >  		results[i].value = NULL;
> > @@ -193,17 +191,29 @@ void tst_kconfig_read(const char *const *kconfigs,
> >  
> >  	while (fgets(buf, sizeof(buf), fp)) {
> >  		for (i = 0; i < cnt; i++) {
> > -			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
> > -				for (j = 0; j < cnt; j++) {
> > -					if (matches[j].match)
> > -						break;
> > +			memset(kconfig_multi, 0, sizeof(kconfig_multi));
> > +			/* strtok_r will split kconfigs[i] to multi string, so copy it */
> > +			memcpy(kconfig_multi, kconfigs[i], strlen(kconfigs[i]));
> > +			kconfig_token = strtok_r(kconfig_multi, "|=", &p_left);
> > +
> > +			while (kconfig_token != NULL) {
> > +				if (strncmp("CONFIG_", kconfig_token, 7))
> > +					tst_brk(TBROK, "Invalid config string '%s'", kconfig_token);
> > +				matches[i].len = strlen(kconfig_token);
> > +				if (match(&matches[i], kconfig_token, &results[i], buf)) {
> > +					for (j = 0; j < cnt; j++) {
> > +						if (matches[j].match)
> > +							break;
> > +					}
> > +					if (j == cnt)
> > +						goto exit;
> 
> I do not think that this actually works correctly. One of the problems I
> see is that we do match only the CONFIG_FOO part in the
> tst_kconfig_read() and the result value is evaluated later on. This
> means that if we had something as "CONFIG_FOO=5|CONFIG_FOO=4" the code
> will pick up only the first occurence of the = and we would end up doing
> strcmp("4", "5|CONFIG_FOO=4") which would fail as well.
> 
> If we wanted to have proper solution for logic statements inside of the
> kconfig parser we would have to isolate the CONFIG_FOO names first, pass
> them to the tst_kconfig_read() function, that would get us values for
> all config variables we need, then we could split the configs strings
> greadily on | and evaluate them one after another.
> 
> So the first function would have to be able to get arrays of strings and
> return another array of strings isolating the CONFIG_FOO variables. That
> would be passed to tst_kconfig_read() that would yield results[] array,
> for all interesting variables. From that point we can split the kconfig
> strings by | and evaluate one after another until we get match or end of
> the string.
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
